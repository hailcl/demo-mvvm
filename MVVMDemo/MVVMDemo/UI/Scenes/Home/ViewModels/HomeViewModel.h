//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VenueService;
@class VenueViewModel;

@protocol HomeView <NSObject>
@required

- (void)bindData:(NSArray <VenueViewModel*>*)venues;

@end

@interface HomeViewModel : NSObject

- (instancetype)initWithVenueService:(NSObject <VenueService>*)venueService view:(NSObject <HomeView>*)view;
- (void)explore;

@end
