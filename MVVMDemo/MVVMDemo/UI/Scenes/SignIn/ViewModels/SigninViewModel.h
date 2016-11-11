//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserService;



@protocol SigninView <NSObject>

- (void)preventUserInteractor;
- (void)allowUserInteractor;
- (void)changeLoginButtonState:(BOOL)enable;

@end

@interface SigninViewModel : NSObject

- (instancetype)initWithView:(NSObject <SigninView> *)view userService:(NSObject <UserService> *)userService;

- (void)login;
- (void)changeUsername:(NSString *)username;
- (void)changePassword:(NSString *)password;

@end