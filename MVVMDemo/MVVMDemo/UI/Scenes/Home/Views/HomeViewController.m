//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "HomeViewController.h"
#import "CenterView.h"
#import "HomeViewModel.h"
#import "Dependences.h"
#import "HomeDataSource.h"
#import "Navigator.h"

@interface HomeViewController () <HomeView, HomeDataSourceView>

@property (nonatomic, strong) HomeViewModel * model;
@property (nonatomic, strong) HomeDataSource * dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(openNavigations)];
    [self.navigationItem setLeftBarButtonItem:item animated:YES];

    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc] initWithTitle:@"PassBy"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(showPassBy)];
    [self.navigationItem setRightBarButtonItem:itemRight animated:YES];

    _dataSource = [[HomeDataSource alloc] initWithView:self];
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _dataSource;

    _model = [[HomeViewModel alloc] initWithVenueService:[Dependences sharedInstance].venueService view:self
                                         locationService:[Dependences sharedInstance].locationService];
    [_model explore];
}

- (void)openNavigations {
    if (_centerView) {
        [_centerView showNavigations:nil];
    }
}

- (void)bindData:(NSArray <VenueViewModel *> *)venues {
    [_dataSource loadVenues:venues];
    [_tableView reloadData];
}

- (void)bindLocation:(CLLocation *)location {
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1f, 0.1f);
    CLLocationCoordinate2D coordinate = {location.coordinate.latitude,location.coordinate.longitude};
    MKCoordinateRegion region = {coordinate, span};
    MKCoordinateRegion regionThatFits = [_mapView regionThatFits:region];

    [_mapView setRegion:regionThatFits animated:YES];
}

- (void)viewVenue:(VenueViewModel *)venue {
    [self.navigator showVenue:venue];
}

- (void)showPassBy {
    [self.navigator showPassBy];
}

@end
