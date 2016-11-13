//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VenueViewModel;

@protocol VenuesDataSourceView <NSObject>

- (void)viewVenue:(VenueViewModel *)venue;

@end

@interface VenuesDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) NSObject <VenuesDataSourceView> * view;

- (instancetype)initWithView:(NSObject <VenuesDataSourceView> * ) view;

- (void)loadVenues:(NSArray <VenueViewModel*>*)venues;

@end