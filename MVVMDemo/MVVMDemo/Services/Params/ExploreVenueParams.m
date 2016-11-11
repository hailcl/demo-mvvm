//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "ExploreVenueParams.h"


@implementation ExploreVenueParams

- (instancetype)initWithLatitude:(double)latitude longitude:(double)longitude {
    if (self = [super init]) {
        _latitude = latitude;
        _longitude = longitude;
    }

    return self;
}


@end