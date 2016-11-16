//
// Created by Nguyen Thanh Hai on 11/16/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VenueService;
@protocol VenueDetailView <NSObject>

- (void)showVenueDetailAtUrl:(NSString *)url;

@end

@interface VenueDetailViewModel : NSObject

- (void)discover;

- (id)initWithVenueId:(NSString *)venueId venueService:(NSObject <VenueService> *)service
                 view:(NSObject <VenueDetailView>*)view;

@end