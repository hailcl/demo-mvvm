//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VenueAPI.h"

@class APIClient;


@interface VenueAPICLient : NSObject <VenueAPI>

- (instancetype)initWithAPIClient:(APIClient * )apiClient;

@end