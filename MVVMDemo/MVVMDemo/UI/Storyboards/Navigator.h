//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VenueViewModel;

@interface Navigator : NSObject

- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard
                navigateController:(UINavigationController *)navigateController;

- (void)showVenue:(VenueViewModel *)venue;
- (void)showPassBy;

@end