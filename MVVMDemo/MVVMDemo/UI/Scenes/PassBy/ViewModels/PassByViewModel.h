//
// Created by Nguyen Thanh Hai on 11/13/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VenueViewModel;
@protocol VenueService;

@protocol PassByView <NSObject>

- (void)bindData:(NSArray <VenueViewModel*> *)venues;

@end

@interface PassByViewModel : NSObject <UISearchBarDelegate>

- (instancetype)initWithView:(NSObject <PassByView> *)view venueService:(NSObject<VenueService> *)venueService;

- (void)loadVenues;
@end