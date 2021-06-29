//
//  LoginVIew.m
//  IM-V2
//
//  Created by Admin on 2021/6/25.
//

#import "LoginView.h"
#import "Masonry.h"
#import "HomeController.h"
#import "AppDelegate.h"
#import "KKNetConnect.h"

@interface LoginView () <UITextFieldDelegate>

@property (nonatomic) BOOL isLogin;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *titleLable;


@end

@implementation LoginView

- (instancetype)init
{
    if(self = [super init]){
        [self setupSubviews];
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if(self = [super initWithFrame:frame]){
//        [self setupSubviews];
//    }
//    return self;
//}

#pragma mark - Subviews
- (void)setupSubviews
{
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.image = [UIImage imageNamed:@"BootPage"];
//    [self.view insertSubview:imageView atIndex:0];
    
    self.backView = [[UIView alloc]init];
    //    self.backView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];


    self.titleLable = [[UILabel alloc] init];
    [self.backView addSubview:self.titleLable];
    self.titleLable.textColor = [UIColor systemBlueColor];


    self.titleLable.font = [UIFont systemFontOfSize:95];
    self.titleLable.text = @"IM";
    self.titleLable.textAlignment = NSTextAlignmentCenter;

    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.top.equalTo(self.backView.mas_top).offset(96);
    }];

    self.nameField.keyboardType = UIKeyboardTypeNumberPad;
    self.nameField.keyboardAppearance = UIKeyboardAppearanceDefault;
    self.nameField = [[UITextField alloc] init];
    self.nameField.backgroundColor = [UIColor whiteColor];
    self.nameField.delegate = self;
    // 边框样式
    self.nameField.borderStyle = UITextBorderStyleNone;
    self.nameField.placeholder = @"🆔";
    self.nameField.returnKeyType = UIReturnKeyGo;
    self.nameField.font = [UIFont systemFontOfSize:17];
    self.nameField.rightViewMode = UITextFieldViewModeWhileEditing;
    // 右边的一键删除button
    self.nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 18, 10)];
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    self.nameField.layer.cornerRadius = 25;
    self.nameField.layer.borderWidth = 1;
    self.nameField.layer.borderColor = [UIColor lightGrayColor].CGColor;


    [self.backView addSubview:self.nameField];
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(30);
        make.right.equalTo(self.backView).offset(-30);
        make.top.equalTo(self.titleLable.mas_bottom).offset(40);
        make.height.equalTo(@55);
    }];
    self.passwordField = [[UITextField alloc] init];
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.delegate = self;
    self.passwordField.borderStyle = UITextBorderStyleNone;
    self.passwordField.placeholder = @"🔐";
    self.passwordField.font = [UIFont systemFontOfSize:17];
    self.passwordField.returnKeyType = UIReturnKeyGo;
    // 密码🔐安全样式
    self.passwordField.secureTextEntry = YES;
    self.passwordField.clearsOnBeginEditing = NO;

    self.passwordField.rightViewMode = UITextFieldViewModeAlways;
    self.passwordField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 18, 10)];
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordField.layer.cornerRadius = 25;
    self.passwordField.layer.borderWidth = 1;
    self.passwordField.layer.borderColor = [UIColor lightGrayColor].CGColor;

    [self.backView addSubview:self.passwordField];
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(30);
        make.right.equalTo(self.backView).offset(-30);
        make.top.equalTo(self.nameField.mas_bottom).offset(20);
        make.height.equalTo(@55);
    }];

    [self setupLoginButton];
    
}

- (void)setupLoginButton
{
    self.loginButton = [[UIButton alloc]init];
    [self.loginButton setTitle:@"登陆" forState: UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:27];
    [self.loginButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    
    [self.backView addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(30);
        make.right.equalTo(self.backView).offset(-30);
        make.top.equalTo(self.passwordField.mas_bottom).offset(40);
        make.height.equalTo(@55);
    }];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([self.nameField isFirstResponder]){
        [self.passwordField becomeFirstResponder];
    }
    else if([self.passwordField isFirstResponder]){
        //[self loginClick:self.loginButton];
        [self.passwordField resignFirstResponder];
    }
    return YES;
}




@end





