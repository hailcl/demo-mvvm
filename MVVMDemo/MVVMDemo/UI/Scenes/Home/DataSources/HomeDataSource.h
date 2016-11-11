//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VenueViewModel;

@protocol HomeDataSourceView <NSObject>

- (void)viewVenue:(VenueViewModel *)venue;

@end

@interface HomeDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) NSObject <HomeDataSourceView> * view;

- (instancetype)initWithView:(NSObject <HomeDataSourceView> * ) view;

- (void)loadVenues:(NSArray <VenueViewModel*>*)venues;

@end