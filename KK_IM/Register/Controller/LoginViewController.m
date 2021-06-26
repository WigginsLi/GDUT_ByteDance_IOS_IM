//
//  LoginViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/25.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"
#import "MainPageViewController.h"
#import "UserInfoModel.h"
#import "infoArchive.h"


@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.usernameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

// 监听文本框


// 文本框变化时执行, 判断账号密码是否都存在
- (void) textChange {
    if (self.usernameField.text.length > 0 && self.passwordField.text.length > 0) {
        self.loginButton.enabled = YES;
    }else {
        self.loginButton.enabled = NO;
    }
}

- (void) login {
    //创建链接，指定相应URL
    KKNetConnect* conn = [[KKNetConnect alloc]initWithUrl:@"https://qczgqv.fn.thelarkcloud.com/ifUserExist"];
    //异步发送请求，成功后返回主线程执行finish函数
    [conn senduserAccountCheckIfExists:self.usernameField.text finishBlock:^(NSDictionary * _Nonnull res) {
        
        [self verifyExist:res andConnect:conn];
        
    }];
}

//被login调用，当判断用户存在时的回调函数
-(void) verifyExist:(NSDictionary*)res andConnect:(KKNetConnect*)conn{
    //存在用户
    if ([res[@"result"]  isEqual:  @(YES)]){
        //去验证密码
        [conn changURL:@"https://qczgqv.fn.thelarkcloud.com/MatchUserPassword"];
        //发送请求
        [conn senduserAccount:self.usernameField.text andPassword:self.passwordField.text finishBlock:^(NSDictionary * _Nonnull loginRes) {
            [self verifySuccess:loginRes andConnect:conn];
        }];
            
        }else {
            //不存在用户
            NSLog(@"账号未注册！");
            //跳转至注册页面
            [self performSegueWithIdentifier:@"register" sender:nil];
        }
}

//被verifyExist调用，当判断密码正确时的回调函数
-(void) verifySuccess:(NSDictionary*)loginRes andConnect:(KKNetConnect*)conn{
    //成功匹配密码
    if([loginRes[@"result"] isEqual:@(YES) ]){
        NSLog(@"密码正确！");
        //进入主页面之前，获取个人信息并归档。
        [conn changURL:@"https://qczgqv.fn.thelarkcloud.com/getUserInfo"];
        [conn getUserInfoForUserId:self.usernameField.text finishBlock:^(NSDictionary * _Nonnull userInfo) {
            //下面是进行归档

            infoArchive* archiver = [infoArchive new];

            [archiver archiveMyInfo:userInfo];

            [archiver unarchiveMyInfo];
        }];
        
        /*  TODO： 归档个人用户信息的数据  */
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
    }else{
        //不匹配
        NSLog(@"账号密码不匹配！");
    }
}

// 将值通过segue传递
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"register"]) {
        RegisterViewController *theVc = segue.destinationViewController;
        theVc.username = self.usernameField.text;
        theVc.password = self.passwordField.text;
    }
}

@end
