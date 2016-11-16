//
// Created by Nguyen Thanh Hai on 11/16/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "DiscoverVenueParams.h"


@implementation DiscoverVenueParams

- (instancetype)initWithVenueId:(NSString *)venueId {
    if (self = [super init]) {
        self.venueId = venueId;    
    }
    
    return self;
}
@end