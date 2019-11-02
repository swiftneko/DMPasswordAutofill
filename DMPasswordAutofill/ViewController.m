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


@end
