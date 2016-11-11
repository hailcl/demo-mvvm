//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "HomeViewModel.h"
#import "VenueService.h"
#import "ExploreVenueParams.h"
#import "VenueViewModel.h"
#import "Venue.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface HomeViewModel ()

@property (nonatomic, weak) NSObject <VenueService> * venueService;
@property (nonatomic, weak) NSObject <HomeView> * view;

@end

@implementation HomeViewModel

- (instancetype)initWithVenueService:(NSObject <VenueService>*)venueService view:(NSObject <HomeView>*)view {
    if (self = [super init]) {
        _venueService = venueService;
        _view = view;
    }

    return self;
}

- (void)explore {
    ExploreVenueParams * params = [[ExploreVenueParams alloc] initWithLatitude:10.8038533
                                                                     longitude:106.6746885];
    [_venueService exploreAt:params
                    complete:^(NSArray<Venue *> *venues) {
                        NSMutableArray <VenueViewModel*>* viewModels = [NSMutableArray new];
                        [venues enumerateObjectsUsingBlock:^(Venue *obj, NSUInteger idx, BOOL *stop) {
                            VenueViewModel * viewModel = [VenueViewModel new];
                            viewModel.name = obj.name;
                            viewModel.location = obj.location;

                            [viewModels addObject:viewModel];
                        }];

                        [_view bindData:viewModels];
                    }];
}


@end
