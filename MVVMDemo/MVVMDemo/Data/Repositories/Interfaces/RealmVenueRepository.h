//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Venue;
@class RealmVenue;

@protocol RealmVenueRepository <NSObject>

- (void)saveVenues:(NSArray<Venue *> *)venues complete:(void (^)(NSArray *venues))completion;
- (void)getPassByVenues:(void (^)(NSArray<RealmVenue *> *venues))completion;
- (void)searchPassBy:(NSString *)keyword complete:(void (^)(NSArray<RealmVenue *> *venues))completion;

@end
