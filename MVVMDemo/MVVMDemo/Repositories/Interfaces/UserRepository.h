//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class SaveUserParams;

@protocol UserRepository <NSObject>

- (void)saveUser:(SaveUserParams*)params complete:(void(^)(User * user))completion;

@end