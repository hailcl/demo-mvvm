//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Venue : NSObject

@property (nonatomic, copy) NSString * venueId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * location;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) float rating;
@property (nonatomic, copy) NSString * canonicalUrl;

- (instancetype)initWithId:(NSString *)id name:(NSString *)name location:(NSString *)location latitude:(double)lat
                 longitude:(double)lng rating:(float)rating canonicalUrl:(NSString *)canonicalUrl;

@end