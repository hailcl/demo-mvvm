//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenuesDataSource.h"
#import "VenueViewCell.h"
#import "VenueViewModel.h"

@interface VenuesDataSource () {
    NSMutableArray <VenueViewModel*> * _venues;
}

@end

@implementation VenuesDataSource


- (instancetype)initWithView:(NSObject <VenuesDataSourceView> *)view {
    if (self = [super init]) {
        _venues = [NSMutableArray new];
        _view = view;
    }

    return self;
}


- (void)loadVenues:(NSArray <VenueViewModel *> *)venues {
    [_venues setArray:venues];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _venues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VenueViewCell * cell = (VenueViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VenueViewCell"
                                                                           forIndexPath:indexPath];
    cell.model = _venues[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_view viewVenue:_venues[indexPath.row]];
}


@end