//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "Configurations.h"

#define kAPI_BASE_URL @"API_BASE_URL"
#define kAPI_CLIENT_ID @"API_CLIENT_ID"
#define kAPI_CLIENT_SECRET @"API_CLIENT_SECRET"

@implementation Configurations

- (instancetype)init {
    if (self = [super init]) {
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        _baseAPIUrl = infoDict[kAPI_BASE_URL];
        _apiClientId = infoDict[kAPI_CLIENT_ID];
        _apiClientSecret = infoDict[kAPI_CLIENT_SECRET];
    }

    return self;
}

@end