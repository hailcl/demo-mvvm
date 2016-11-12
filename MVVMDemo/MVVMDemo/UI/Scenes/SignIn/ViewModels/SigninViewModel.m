//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "SigninViewModel.h"
#import "UserService.h"
#import "LoginParams.h"

@interface SigninViewModel () <UserServiceSubscriber> {
    NSString * _username;
    NSString * _password;
}

@property (nonatomic, weak) NSObject <SigninView> * view;
@property (nonatomic, weak) NSObject <UserService> * userService;

@end

@implementation SigninViewModel

- (instancetype)initWithView:(NSObject <SigninView> *)view userService:(NSObject <UserService> *)userService {
    if (self = [super init]) {
        _view = view;
        _userService = userService;
        [_userService addSubcriber:self];
        _username = @"";
        _password = @"";
    }

    return self;
}

- (void)login {
    if (_view != nil) {
        [_view preventUserInteractor];
    }
    LoginParams * params = [[LoginParams alloc] init];
    params.username = _username;
    [_userService loginWithParams:params complete:nil];
}

- (void)loggedIn:(User *)user {
    [_view allowUserInteractor];
}

- (void)loggedOut {

}


- (void)changeUsername:(NSString *)username {
    _username = username;
    [self updateView];
}

- (void)changePassword:(NSString *)password {
    _password = password;
    [self updateView];
}

- (void)updateView {
    [_view changeLoginButtonState:[self validateEmail:_username] && _password.length >= 6];
}

/*
 * http://stackoverflow.com/questions/3139619/check-that-an-email-address-is-valid-on-ios
 */
-(BOOL)validateEmail:(NSString *)checkString {
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

    return [emailTest evaluateWithObject:checkString];
}

@end
