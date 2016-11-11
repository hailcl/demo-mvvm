//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Storyboards;
@protocol UserService;
@class Configurations;
@protocol VenueService;


@interface Dependences : NSObject

@property (nonatomic, strong) Storyboards * storyboards;
@property (nonatomic, strong) NSObject<UserService> * userService;
@property (nonatomic, strong) NSObject<VenueService> * venueService;
@property (nonatomic, strong) Configurations * configurations;

+ (instancetype)sharedInstance;

@end