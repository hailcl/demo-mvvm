//
// Created by Nguyen Thanh Hai on 11/12/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@protocol SessionRepository <NSObject>

- (User*)currentUser;
- (void)storeSession:(User*)user;
- (void)clear;

@end