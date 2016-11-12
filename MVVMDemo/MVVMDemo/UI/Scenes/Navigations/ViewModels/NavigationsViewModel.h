//
// Created by Nguyen Thanh Hai on 11/12/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserService;


@interface NavigationsViewModel : NSObject

- (instancetype)initWithUserService:(NSObject <UserService>*)userService;
- (void)logout;

@end