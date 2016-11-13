//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Venue;
@class ExploreVenueParams;

@protocol VenueService <NSObject>

- (void)exploreAt:(ExploreVenueParams*)params complete:(void(^)(NSArray <Venue*> *venues))completion;

- (void)getPassByVenues:(void (^)(NSArray<Venue *> *venues))completion;
- (void)searchPassBy:(NSString *)keyword complete:(void (^)(NSArray<Venue *> *venues))completion;
@end
