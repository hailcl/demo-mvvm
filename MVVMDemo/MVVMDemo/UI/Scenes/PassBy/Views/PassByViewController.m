//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "PassByViewController.h"
#import "PassByViewModel.h"
#import "VenuesDataSource.h"
#import "Dependences.h"
#import "Navigator.h"

@interface PassByViewController () <PassByView, VenuesDataSourceView>

@property (nonatomic, strong) PassByViewModel * model;
@property (nonatomic, strong) VenuesDataSource * dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar * searchBar;

@end

@implementation PassByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = [[VenuesDataSource alloc] initWithView:self];
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _dataSource;
    _model = [[PassByViewModel alloc] initWithView:self venueService:[Dependences sharedInstance].venueService];
    [_model loadVenues];
    _searchBar.delegate = _model;
    self.title = @"Pass By";
}

- (void)bindData:(NSArray <VenueViewModel *> *)venues {
    [_dataSource loadVenues:venues];
    [_tableView reloadData];
}

- (void)viewVenue:(VenueViewModel *)venue {
    [self.navigator showVenue:venue];
}


@end
