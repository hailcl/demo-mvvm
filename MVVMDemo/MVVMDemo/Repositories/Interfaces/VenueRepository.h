//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Venue;

@protocol VenueRepository <NSObject>

- (void)saveVenues:(NSArray<Venue*>*)venues complete:(void(^)(NSArray * venues))completion;
- (void)getPassByVenues:(void (^)(NSArray<Venue *> *venues))completion;
- (void)searchPassBy:(NSString *)keyword complete:(void (^)(NSArray<Venue *> *venues))completion;

@end