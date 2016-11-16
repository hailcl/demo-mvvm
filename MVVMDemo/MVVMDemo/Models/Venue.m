//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "Venue.h"
#import "ExploreVenueParams.h"
#import "DiscoverVenueParams.h"


@implementation Venue

- (instancetype)initWithId:(NSString *)id name:(NSString *)name location:(NSString *)location latitude:(double)lat
                 longitude:(double)lng rating:(float)rating canonicalUrl:(NSString *)canonicalUrl {
    if (self = [super init]) {
        _venueId = id;
        _name = name;
        _location = location;
        _latitude = lat;
        _longitude = lng;
        _rating = rating;
        _canonicalUrl = canonicalUrl;
    }

    return self;
}

@end