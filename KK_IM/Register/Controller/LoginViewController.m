//
//  LoginViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/25.
//

#import "LoginViewController.h"

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
        //JSON转成字典
        NSDictionary* dictPraseFromRes = res;
        //存在用户
        if ([dictPraseFromRes[@"result"]  isEqual:  @(YES)]){
            //去验证密码
            [conn changURL:@"https://qczgqv.fn.thelarkcloud.com/MatchUserPassword"];
            //发送请求
            [conn senduserAccount:self.usernameField.text andPassword:self.passwordField.text finishBlock:^(NSDictionary * _Nonnull loginRes) {
                NSDictionary* loginResDict = loginRes;
                //成功匹配密码
                if([loginResDict[@"result"] isEqual:@(YES) ]){
                    //进入主页面
                    [self performSegueWithIdentifier:@"loginSegue" sender:self.usernameField];
                }else{
                    //不匹配
                    NSLog(@"账号密码不匹配！");
                }
                            
            }];
                
            }else {
                //不存在用户
                NSLog(@"账号未注册！");
                //跳转至注册页面
                [self performSegueWithIdentifier:@"register" sender:self.usernameField];
            }
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
