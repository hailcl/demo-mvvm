//
// Created by Nguyen Thanh Hai on 11/8/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "Constants.h"

#define UIColorFromRGBA(rgbaValue) [UIColor colorWithRed:((float)((rgbaValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbaValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbaValue & 0xFF)) / 255.0 \
alpha:((float)((rgbaValue & 0xFF000000) >> 24)) / 255.0]

@implementation Constants

+ (instancetype)sharedInstance {
        static Constants *sharedInstance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [[Constants alloc] init];
        });

        return sharedInstance;
}

- (instancetype)init {
        if (self = [super init]) {
                _textForegroundColor = UIColorFromRGBA(0xFFFFFFFF);
                _textPlacehoderColor = UIColorFromRGBA(0xFFFFFFFF);
                _primaryColor = UIColorFromRGBA(0x6563A4);
                _secondaryColor = UIColorFromRGBA(0xFFFFFFFF);
        }

        return self;
}

@end
