//
// Created by Nguyen Thanh Hai on 11/8/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Constants : NSObject

@property (nonatomic, strong) UIColor * textForegroundColor;
@property (nonatomic, strong) UIColor * textPlacehoderColor;

@property(nonatomic, strong) UIColor *primaryColor;
@property(nonatomic, strong) UIColor *secondaryColor;

+ (instancetype)sharedInstance;

@end
