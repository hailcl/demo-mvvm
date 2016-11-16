//
// Created by Nguyen Thanh Hai on 11/16/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenueDetailViewModel.h"
#import "VenueService.h"
#import "DiscoverVenueParams.h"
#import "Venue.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface VenueDetailViewModel ()

@property (nonatomic, copy) NSString *venueId;
@property (nonatomic, weak) NSObject <VenueService>* venueService;
@property (nonatomic, weak) NSObject <VenueDetailView> * view;

@end

@implementation VenueDetailViewModel
- (id)initWithVenueId:(NSString *)venueId venueService:(NSObject <VenueService> *)service
                 view:(NSObject <VenueDetailView> *)view {
    if (self = [super init]) {
        self.venueId = venueId;
        self.venueService = service;
        self.view = view;
    }

    return self;
}

- (void)discover {
    DiscoverVenueParams * params = [[DiscoverVenueParams alloc] initWithVenueId:_venueId];
    [_venueService discover:params complete:^(Venue * venue, NSError * error) {
        DDLogVerbose(@"Venue Detail: %@ - %@", venue.canonicalUrl, venue.name);
        if (!error) {
            [_view showVenueDetailAtUrl:venue.canonicalUrl];
        }
    }];
}

@end
