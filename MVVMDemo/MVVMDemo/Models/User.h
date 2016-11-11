//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface User : NSObject

@property (nonatomic, copy) NSString * username;

- (instancetype)initWithUsername:(NSString *)username;

@end