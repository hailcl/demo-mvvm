//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenueRepositoryImpl.h"
#import "RealmUserRepository.h"
#import "VenueRepository.h"
#import "RealmVenueRepository.h"
#import "Venue.h"
#import "RealmVenue.h"

@interface VenueRepositoryImpl ()

@property (nonatomic, strong) NSObject <RealmVenueRepository> * realmVenueRepository;

@end

@implementation VenueRepositoryImpl

- (id)initWithRealVenueRepository:(NSObject <RealmVenueRepository> *)realmVenueRepository {
    if (self = [super init]) {
        _realmVenueRepository = realmVenueRepository;
    }

    return self;
}

- (void)saveVenues:(NSArray<Venue *> *)venues complete:(void (^)(NSArray *venues))completion {
    [_realmVenueRepository saveVenues:venues complete:completion];
}

- (void)getPassByVenues:(void (^)(NSArray<Venue *> *venues))completion {
    [_realmVenueRepository getPassByVenues:^(NSArray<RealmVenue *> *venues) {
        NSMutableArray <Venue*> * models = [NSMutableArray new];
        [venues enumerateObjectsUsingBlock:^(RealmVenue *obj, NSUInteger idx, BOOL *stop) {
            Venue * model = [[Venue alloc] initWithId:obj.venueId
                                                 name:obj.name
                                             location:obj.location
                                             latitude:obj.latitude
                                            longitude:obj.longitude
                                               rating:obj.rating];
            [models addObject:model];
        }];

        completion ? completion(models) : nil;
    }];
}

- (void)searchPassBy:(NSString *)keyword complete:(void (^)(NSArray<Venue *> *venues))completion {
    [_realmVenueRepository searchPassBy:keyword complete:^(NSArray<RealmVenue *> *venues) {
        NSMutableArray <Venue*> * models = [NSMutableArray new];
        [venues enumerateObjectsUsingBlock:^(RealmVenue *obj, NSUInteger idx, BOOL *stop) {
            Venue * model = [[Venue alloc] initWithId:obj.venueId
                                                 name:obj.name
                                             location:obj.location
                                             latitude:obj.latitude
                                            longitude:obj.longitude
                                               rating:obj.rating];
            [models addObject:model];
        }];

        completion ? completion(models) : nil;
    }];
}


@end