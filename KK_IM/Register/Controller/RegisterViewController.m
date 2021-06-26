//
//  RegisterViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.usernameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.registerButton addTarget:self action:@selector(registe) forControlEvents:UIControlEventTouchUpInside];
    
    self.usernameField.text = self.username;
    self.passwordField.text = self.password;
}

// 文本框变化时执行, 判断账号密码是否都存在
- (void) textChange {
    if (self.usernameField.text.length > 0 && self.passwordField.text.length > 0) {
        self.registerButton.enabled = YES;
    }else {
        self.registerButton.enabled = NO;
    }
}

- (void) registe {
    // TODO: 补全注册逻辑
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
