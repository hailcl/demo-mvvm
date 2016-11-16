//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenueAPICLient.h"
#import "ExploreVenueParams.h"
#import "Venue.h"
#import "APIClient.h"
#import "DiscoverVenueParams.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface VenueColumns: NSObject

@property (nonatomic, copy) NSString * meta;
@property (nonatomic, copy) NSString * code;
@property (nonatomic, copy) NSString * response;
@property (nonatomic, copy) NSString * groups;
@property (nonatomic, copy) NSString * items;
@property (nonatomic, copy) NSString * reasons;
@property (nonatomic, copy) NSString * venue;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * address;
@property (nonatomic, copy) NSString * lat;
@property (nonatomic, copy) NSString * lng;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * rating;
@property (nonatomic, copy) NSString * location;
@property (nonatomic, copy) NSString * canonicalUrl;

@end


@implementation VenueColumns

- (instancetype)init {
    if (self = [super init]) {
        _meta = @"meta";
        _code = @"code";
        _response = @"response";
        _groups = @"groups";
        _items = @"items";
        _reasons = @"reasons";
        _venue = @"venue";
        _id = @"id";
        _address = @"address";
        _lat = @"lat";
        _lng = @"lng";
        _name = @"name";
        _rating = @"rating";
        _location = @"location";
        _canonicalUrl = @"canonicalUrl";
    }

    return self;
}

@end

@interface VenueAPICLient ()

@property (nonatomic, strong) APIClient * apiClient;
@property (nonatomic, strong) VenueColumns * columns;

@end

@implementation VenueAPICLient

- (instancetype)initWithAPIClient:(APIClient * )apiClient {
    if (self = [super init]) {
        _apiClient = apiClient;
        _columns = [VenueColumns new];
    }

    return self;
}

- (void)explore:(ExploreVenueParams *)params complete:(void (^)(NSArray<Venue *> *venues, NSError *error))completion {
    __weak __typeof(self) weakSelf = self;
    [_apiClient getObjectAt:@"venues/explore"
                     params:@{@"ll" : [NSString stringWithFormat:@"%lf,%lf", params.latitude, params.longitude]}
                   complete:^(NSDictionary *data, NSError *error) {
                       if (error == nil) {
                           NSDictionary * metaDict = data[_columns.meta];
                           if ([metaDict[_columns.code] intValue] == 200) {
                                NSDictionary * responseDict = data[_columns.response];
                                NSArray * groups = responseDict[_columns.groups];
                               NSMutableArray <Venue*> * venues = [NSMutableArray new];
                               [groups enumerateObjectsUsingBlock:^(NSDictionary * groupItem, NSUInteger idx, BOOL *stop) {
                                   NSArray * items = groupItem[_columns.items];
                                   [items enumerateObjectsUsingBlock:^(NSDictionary * itemDict, NSUInteger idx, BOOL *stop) {
                                       Venue * venue = [weakSelf venueFromDict:itemDict];
                                       [venues addObject:venue];
                                   }];
                               }];

                               completion ? completion(venues, error) : nil;
                           }

                           else {
                               completion ? completion(nil, [NSError errorWithDomain:@"" code:9999 userInfo:@{}]) : nil;
                           }
                       } else {
                           completion ? completion(nil, error) : nil;
                       }
    }];
}

- (void)discover:(DiscoverVenueParams *)params complete:(void (^)(Venue *venue, NSError *error))completion {
    __weak __typeof(self) weakSelf = self;
    NSString * url = [NSString stringWithFormat:@"venues/%@",params.venueId];
    [_apiClient getObjectAt:url
                     params:@{}
                   complete:^(NSDictionary *data, NSError *error) {
                       if (error == nil) {
                           NSDictionary * metaDict = data[_columns.meta];
                           if ([metaDict[_columns.code] intValue] == 200) {
                               NSDictionary * responseDict = data[_columns.response];
                               Venue * venue = [weakSelf venueFromDict:responseDict];
                               completion ? completion(venue, error) : nil;
                           }

                           else {
                               completion ? completion(nil, [NSError errorWithDomain:@"" code:9999 userInfo:@{}]) : nil;
                           }
                       } else {
                           completion ? completion(nil, error) : nil;
                       }
                   }];
}


- (Venue *)venueFromDict:(NSDictionary *)dictionary {
    NSDictionary * venueDict = dictionary[_columns.venue];
    NSString * venueId = venueDict[_columns.id];
    NSString * name = venueDict[_columns.name];

    NSDictionary * locationDict = venueDict[_columns.location];
    NSString * location = locationDict[_columns.address];
    double latitude = [locationDict[_columns.lat] doubleValue];
    double longitude = [locationDict[_columns.lng] doubleValue];;
    float rating = [venueDict[_columns.rating] floatValue];

    Venue * venue = [[Venue alloc] initWithId:venueId
                                         name:name
                                     location:location
                                     latitude:latitude
                                    longitude:longitude
                                       rating:rating 
                                 canonicalUrl:venueDict[_columns.canonicalUrl]];

    return venue;
}

@end
