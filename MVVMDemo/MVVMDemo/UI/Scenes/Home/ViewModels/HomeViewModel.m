//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "HomeViewModel.h"
#import "VenueService.h"
#import "ExploreVenueParams.h"
#import "VenueViewModel.h"
#import "Venue.h"
#import "LocationService.h"
#import "Location.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface HomeViewModel ()

@property (nonatomic, weak) NSObject <VenueService> * venueService;
@property (nonatomic, weak) NSObject <HomeView> * view;
@property (nonatomic, weak) NSObject <LocationService> * locationService;
@end

@implementation HomeViewModel

- (instancetype)initWithVenueService:(NSObject <VenueService>*)venueService view:(NSObject <HomeView>*)view
                     locationService:(NSObject <LocationService>*)locationService {
    if (self = [super init]) {
        _venueService = venueService;
        _view = view;
        _locationService = locationService;
    }

    return self;
}

- (void)explore {
    [_locationService locate:^(Location *location, LocationServiceError error) {
        if (error == Succeed) {
            dispatch_after(3.0, dispatch_get_main_queue(), ^{
                [_view bindLocation:[[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude]];
            });
            [self exploreVenueAt:location];
        } else {
            DDLogVerbose(@"Locate Error");
        }
    }];

}

- (void)exploreVenueAt:(Location *)location {
    ExploreVenueParams * params = [[ExploreVenueParams alloc] initWithLatitude:location.latitude
                                                                     longitude:location.longitude];
    [_venueService exploreAt:params
                    complete:^(NSArray<Venue *> *venues) {
                        NSMutableArray <VenueViewModel*>* viewModels = [NSMutableArray new];
                        [venues enumerateObjectsUsingBlock:^(Venue *obj, NSUInteger idx, BOOL *stop) {
                            VenueViewModel * viewModel = [VenueViewModel new];
                            viewModel.name = obj.name;
                            viewModel.venueId = obj.venueId;
                            viewModel.location = obj.location;

                            [viewModels addObject:viewModel];
                        }];

                        [_view bindData:viewModels];
                    }];
}

@end
