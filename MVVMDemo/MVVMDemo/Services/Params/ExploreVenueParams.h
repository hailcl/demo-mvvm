//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ExploreVenueParams : NSObject

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

- (instancetype)initWithLatitude:(double)latitude longitude:(double)longitude;

@end