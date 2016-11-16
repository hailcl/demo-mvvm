//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealmModel.h"

@interface RealmVenue : RealmModel

@property NSString * venueId;
@property NSString * name;
@property NSString * location;
@property NSString *canonicalUrl;
@property double latitude;
@property double longitude;
@property float rating;

@end