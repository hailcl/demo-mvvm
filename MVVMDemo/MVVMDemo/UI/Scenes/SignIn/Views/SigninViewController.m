//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "SigninViewController.h"
#import <FontAwesome/FontAwesome.h>
#import "UIFloatLabelTextField.h"
#import "Constants.h"
#import "SigninViewModel.h"
#import "Dependences.h"

@interface SigninViewController () <SigninView>

@property (nonatomic, weak) IBOutlet UIFloatLabelTextField * usernameTextField;
@property (nonatomic, weak) IBOutlet UIFloatLabelTextField * passwordTextField;
@property SigninViewModel * model;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;

@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[SigninViewModel alloc] initWithView:self userService:[Dependences sharedInstance].userService];

    [self setupUI];
}

- (void)setupUI {
    _usernameTextField.textColor = [Constants sharedInstance].textForegroundColor;
    _usernameTextField.floatLabelActiveColor = [Constants sharedInstance].textForegroundColor;

    _passwordTextField.textColor = [Constants sharedInstance].textForegroundColor;
    _passwordTextField.floatLabelActiveColor = [Constants sharedInstance].textForegroundColor;
}

- (IBAction)signIn:(UIButton *)sender {
    [_model login];
}

- (IBAction)updateUsername:(UIFloatLabelTextField *)sender {
    [_model changeUsername:sender.text];
}

- (IBAction)updatePassword:(UIFloatLabelTextField *)sender {
    [_model changePassword:sender.text];
}

//Sign View

- (void)preventUserInteractor {
    [self showloading];
}

- (void)allowUserInteractor {
    [self hideloading];
}

- (void)changeLoginButtonState:(BOOL)enable {
    _signinButton.enabled = enable;
}

@end
