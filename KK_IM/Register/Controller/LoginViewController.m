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
    if (/*用接口判断用户是否存在 && 账号密码是否匹配*/ TRUE) {
        NSLog(@"登录成功");
        [self performSegueWithIdentifier:@"loginSegue" sender:self.usernameField];
    }else {
        NSLog(@"账号或密码不对");
    }
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
