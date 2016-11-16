//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenueDetailViewController.h"
#import "VenueDetailViewModel.h"
#import "Dependences.h"

@interface VenueDetailViewController () <VenueDetailView>

@property (nonatomic, strong) VenueDetailViewModel * model;
@property (nonatomic, weak) IBOutlet UIWebView * webView;

@end


@implementation VenueDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Venue Detail";
    _model = [[VenueDetailViewModel alloc] initWithVenueId:_venueId
                                              venueService:[Dependences sharedInstance].venueService
                                                      view:self];
    [_model discover];
}

- (void)showVenueDetailAtUrl:(NSString *)url {
    NSURL * requestUrl = [[NSURL alloc] initWithString:url];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestUrl];
    [_webView loadRequest:request];
}


@end