//
// Created by Nguyen Thanh Hai on 11/13/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "PassByViewModel.h"
#import "VenueViewModel.h"
#import "VenueService.h"
#import "Venue.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface PassByViewModel ()

@property (nonatomic, weak) NSObject <PassByView> * view;
@property (nonatomic, weak) NSObject <VenueService> * venueService;
@end

@implementation PassByViewModel

- (instancetype)initWithView:(NSObject <PassByView> *)view venueService:(NSObject <VenueService> *)venueService {
    if (self = [super init]) {
        _venueService = venueService;
        _view = view;
    }

    return self;
}

- (void)loadVenues {
    [_venueService getPassByVenues:^(NSArray <Venue*>* venues) {
        [self bindDataFromVenues:venues];
    }];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        [self loadVenues];
    } else {
        [_venueService searchPassBy:searchText complete:^(NSArray <Venue*>* venues) {
            [self bindDataFromVenues:venues];
        }];
    }
}

- (void)bindDataFromVenues:(NSArray <Venue*>*) venues {
    NSMutableArray <VenueViewModel*>* viewModels = [NSMutableArray new];
    [venues enumerateObjectsUsingBlock:^(Venue *obj, NSUInteger idx, BOOL *stop) {
        VenueViewModel * viewModel = [VenueViewModel new];
        viewModel.name = obj.name;
        viewModel.location = obj.location;

        [viewModels addObject:viewModel];
    }];

    [_view bindData:viewModels];
}

@end