//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Venue;
@class ExploreVenueParams;

@protocol VenueAPI <NSObject>

- (void)explore:(ExploreVenueParams *)params complete:(void(^)(NSArray<Venue*>* venues, NSError * error))completion;

@end