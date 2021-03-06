//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "Navigator.h"
#import "VenueViewModel.h"
#import "VenueDetailViewController.h"
#import "PassByViewController.h"

@interface Navigator ()

@property(nonatomic, strong) UIStoryboard *storyboard;
@property(nonatomic, strong) UINavigationController *navigateController;

@end

@implementation Navigator

- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard
                navigateController:(UINavigationController *)navigateController {
    if (self == [super init]) {
        self.storyboard = storyboard;
        self.navigateController = navigateController;
    }
    
    return self;
}

- (void)showVenue:(VenueViewModel *)venue {
    NSString * identifier = @"VenueDetailViewController";
    VenueDetailViewController * controller = [_storyboard instantiateViewControllerWithIdentifier:identifier];
    controller.venueId = venue.venueId;
    controller.navigator = self;
    [_navigateController pushViewController:controller animated:YES];
}

- (void)showPassBy {
    PassByViewController * controller = [_storyboard instantiateViewControllerWithIdentifier:@"PassByViewController"];
    controller.navigator = self;
    [_navigateController pushViewController:controller animated:YES];
}

@end