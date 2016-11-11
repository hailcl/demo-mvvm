//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "RealmVenueRepositoryImpl.h"
#import "RealmVenueRepository.h"
#import "RealmFactory.h"
#import "Venue.h"
#import "RealmVenue.h"

@interface RealmVenueRepositoryImpl ()

@property (nonatomic, strong) RealmFactory * factory;

@end

@implementation RealmVenueRepositoryImpl

- (instancetype)initWithFactory:(RealmFactory *)factory {
    if (self = [super init]) {
        _factory = factory;
    }

    return self;
}

- (void)saveVenues:(NSArray<Venue *> *)venues complete:(void (^)(NSArray *venues))completion {
    __weak RLMRealm *weakRealm = _factory.realm;
    NSMutableArray<RealmVenue*> * dataModels = [NSMutableArray new];
    [venues enumerateObjectsUsingBlock:^(Venue *model, NSUInteger idx, BOOL *stop) {
        RealmVenue * data = [RealmVenue new];
        data.objectId = model.venueId;
        data.venueId = model.venueId;
        data.name = model.name;
        data.location = model.location;
        data.latitude = model.latitude;
        data.longitude = model.longitude;
        data.rating = model.rating;
        [dataModels addObject:data];
    }];

    [_factory.realm transactionWithBlock:^{
        [weakRealm addOrUpdateObjectsFromArray:dataModels];
        completion ? completion(venues) : nil;
    }];
}


@end
