//
//  ViewController.m
//  DMPasswordAutofill
//
//  Created by swiftneko on 2019/11/2.
//  Copyright © 2019 swiftneko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfNewPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@property (nonatomic, assign) BOOL finish;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tfEmail.textContentType = UITextContentTypeEmailAddress;
    _tfEmail.keyboardType = UIKeyboardTypeEmailAddress;
    
    if (@available(iOS 12.0, *)) {
        _tfNewPassword.textContentType = UITextContentTypeNewPassword;
        _tfNewPassword.secureTextEntry = YES;
        _tfNewPassword.passwordRules = [UITextInputPasswordRules passwordRulesWithDescriptor:@"allowed: uppper, lower, digit, [-().&@?’#,/&quot;+]; minlength: 8;"];
    } else {
        // Fallback on earlier versions
    }
    
    
    _tfPassword.textContentType = UITextContentTypePassword;
    _tfPassword.secureTextEntry = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 如果是直接返回的，则注册失败，不保存用户名和密码
    // 如果是通过 Done 按钮 pop 页面，则不清空用户名和密码。Keychain在页面pop的时候会把用户名和密码保存下载
    if (!_finish) {
        _tfEmail.text = nil;
        _tfNewPassword.text = nil;
        _tfPassword.text = nil;
    }
}

- (IBAction)onTapDone:(UIBarButtonItem *)sender {
    _finish = YES;
    [self.navigationController popViewControllerAnimated:YES];
}



@end
