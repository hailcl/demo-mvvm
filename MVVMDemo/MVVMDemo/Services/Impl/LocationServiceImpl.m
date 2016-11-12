//
// Created by Nguyen Thanh Hai on 11/12/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "LocationServiceImpl.h"
#import "Location.h"
#import <INTULocationManager/INTULocationManager.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface LocationServiceImpl () {
    INTULocationManager * _manager;
    NSMutableArray <LocationServiceSubscriber> * _subscribers;
}

@end

@implementation LocationServiceImpl

- (instancetype)init {
    if (self = [super init]) {
        _manager = [INTULocationManager sharedInstance];
        _subscribers = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)locate:(void (^)(Location *location, LocationServiceError error))completion {
    [_manager requestLocationWithDesiredAccuracy:INTULocationAccuracyCity
                                         timeout:10
                            delayUntilAuthorized:YES
                                           block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
                                               switch (status) {
                                                   case INTULocationStatusServicesDenied: {
                                                       completion ? completion(nil, Permission) : nil;
                                                       break;
                                                   }
                                                   case INTULocationStatusServicesDisabled: {
                                                       completion ? completion(nil, Permission) : nil;
                                                       break;
                                                   }
                                                   case INTULocationStatusServicesRestricted: {
                                                       completion ? completion(nil, Permission) : nil;
                                                       break;
                                                   }
                                                   case INTULocationStatusSuccess: {
                                                       Location * location = [[Location alloc] init];
                                                       location.latitude = currentLocation.coordinate.latitude;
                                                       location.longitude = currentLocation.coordinate.longitude;

                                                       completion ? completion(location, Succeed) : nil;

                                                       [self monitorLocationUpdate];
                                                       break;
                                                   }
                                                   default:
                                                       completion ? completion(nil, Error) : nil;
                                                       break;
                                               }
                                           }];
}

- (void)monitorLocationUpdate {
    [_manager subscribeToSignificantLocationChangesWithBlock:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
        switch (status) {
            case INTULocationStatusSuccess: {
                Location * location = [[Location alloc] init];
                location.latitude = currentLocation.coordinate.latitude;
                location.longitude = currentLocation.coordinate.longitude;

                [self emitLocationChange:location];
                DDLogVerbose(@"location update...");
                break;
            }
            default:
                break;
        }
    }];
}

- (void)emitLocationChange:(Location *)location {
    [_subscribers enumerateObjectsUsingBlock:^(NSObject<LocationServiceSubscriber> *obj, NSUInteger idx, BOOL *stop) {
        [obj changedLocation:location];
    }];
}

- (void)addSubscriber:(NSObject <LocationServiceSubscriber> *)subcriber {
    [_subscribers addObject:subcriber];
}


@end