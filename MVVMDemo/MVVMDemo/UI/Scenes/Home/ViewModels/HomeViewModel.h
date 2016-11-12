//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol VenueService;
@class VenueViewModel;
@protocol LocationService;

@protocol HomeView <NSObject>
@required

- (void)bindData:(NSArray <VenueViewModel*>*)venues;
- (void)bindLocation:(CLLocation *)location;

@end

@interface HomeViewModel : NSObject

- (instancetype)initWithVenueService:(NSObject <VenueService>*)venueService view:(NSObject <HomeView>*)view
                     locationService:(NSObject <LocationService>*)locationService;
- (void)explore;

@end
