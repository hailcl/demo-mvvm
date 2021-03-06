//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenueServiceImpl.h"
#import "VenueRepository.h"
#import "VenueAPI.h"
#import "Venue.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface VenueServiceImpl ()

@property (nonatomic, strong) NSObject <VenueAPI> * venueApi;
@property (nonatomic, strong) NSObject <VenueRepository> * venueRepository;

@end

@implementation VenueServiceImpl

- (instancetype)initWithAPI:(NSObject <VenueAPI> *)api repository:(NSObject <VenueRepository> *) repository {
    if (self = [super init]) {
        _venueApi = api;
        _venueRepository = repository;
    }

    return self;
}

- (void)exploreAt:(ExploreVenueParams *)params complete:(void (^)(NSArray <Venue *> *venues))completion {
    [_venueApi explore:params complete:^(NSArray<Venue*>* venues, NSError * error){
        [_venueRepository saveVenues:venues complete:completion];
    }];
}

- (void)getPassByVenues:(void (^)(NSArray<Venue *> *venues))completion {
    [_venueRepository getPassByVenues:completion];
}

- (void)searchPassBy:(NSString *)keyword complete:(void (^)(NSArray<Venue *> *venues))completion {
    [_venueRepository searchPassBy:keyword complete:completion];
}

- (void)discover:(DiscoverVenueParams *)params complete:(void (^)(Venue *venue, NSError *error))completion {
    [_venueApi discover:params complete:completion];
}


@end