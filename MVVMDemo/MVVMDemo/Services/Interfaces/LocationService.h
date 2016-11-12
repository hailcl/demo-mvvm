//
// Created by Nguyen Thanh Hai on 11/12/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LocationServiceError) {
    Permission,
    Error,
    Succeed
};

@class Location;

@protocol LocationServiceSubscriber <NSObject>

- (void)changedLocation:(Location *)location;

@end

@protocol LocationService <NSObject>

- (void)locate:(void(^)(Location * location, LocationServiceError error))completion;
- (void)addSubscriber:(NSObject <LocationServiceSubscriber>*)subscriber;

@end