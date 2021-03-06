//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RealmUser;
@class SaveUserParams;
@class User;

@protocol RealmUserRepository <NSObject>

- (void)saveUser:(SaveUserParams*)params complete:(void(^)(RealmUser * user))completion;
- (User *)getUserById:(NSString *)userId;

@end
