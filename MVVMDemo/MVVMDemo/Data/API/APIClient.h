//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Configurations;

@interface APIClient : NSObject

- (instancetype)initWithConfiguration:(Configurations *)configurations;

- (void)getObjectAt:(NSString *)url params:(NSDictionary *)params
           complete:(void(^)(NSDictionary *data, NSError * error))completion;
- (void)postObjectAt:(NSString *)url params:(NSDictionary *)params
           complete:(void(^)(NSDictionary *data, NSError * error))completion;

@end