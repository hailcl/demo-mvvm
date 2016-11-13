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

- (void)getPassByVenues:(void (^)(NSArray<RealmVenue *> *venues))completion {
    RLMResults <RealmVenue*> * results = [RealmVenue allObjects];
    NSMutableArray <RealmVenue*> * venues = [NSMutableArray new];
    for (RealmVenue * data in results) {
        [venues addObject:data];
    }
    completion ? completion(venues) : nil;
}

- (void)searchPassBy:(NSString *)keyword complete:(void (^)(NSArray<RealmVenue *> *venues))completion {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name CONTAINS %@", keyword];
    RLMResults <RealmVenue *> * results = [RealmVenue allObjects];
    NSArray <RealmVenue*> * data = [results objectsWithPredicate:pred];
    NSMutableArray <RealmVenue*> * venues = [NSMutableArray new];
    for (RealmVenue * entity in data) {
        [venues addObject:entity];
    }
    completion ? completion(venues) : nil;
}


@end
