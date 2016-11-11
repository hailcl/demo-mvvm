//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "APIClient.h"
#import "Configurations.h"
#import <AFNetworking/AFNetworking.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelOff;

@interface APIClient ()

@property (nonatomic, strong) Configurations * configurations;
@property (nonatomic, strong) AFHTTPRequestSerializer * serializer;
@property (nonatomic, strong) AFURLSessionManager *manager;

@end

@implementation APIClient

- (instancetype)initWithConfiguration:(Configurations *)configurations {
    if (self = [super init]) {
        _serializer = [AFHTTPRequestSerializer serializer];
        _configurations = configurations;
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    }

    return self;
}

- (void)request:(NSString *)method at:(NSString *)url params:(NSDictionary *)params
       complete:(void (^)(NSDictionary *data, NSError *error))completion {
    //Declare Error
    NSError * requestError = nil;

    //Add more params
    NSMutableDictionary * requestParams = [NSMutableDictionary dictionaryWithDictionary:params];
    [requestParams setObject:_configurations.apiClientId forKey:@"client_id"];
    [requestParams setObject:_configurations.apiClientSecret forKey:@"client_secret"];
    [requestParams setObject:@"20140219" forKey:@"v"];
    [requestParams setObject:@"foursquare" forKey:@"m"];
    [requestParams addEntriesFromDictionary:params];

    //Setup Request
    NSMutableURLRequest *request = [_serializer requestWithMethod:method
                                                        URLString:url
                                                       parameters:requestParams
                                                            error:&requestError];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    DDLogDebug(@"Request Header: %@", request.allHTTPHeaderFields);

    //Make Reuqest
    [[_manager dataTaskWithRequest:request
                completionHandler:^(NSURLResponse *response, id responseObject, NSError *responseError) {
                    DDLogDebug(@"Response: %@", responseObject);
                    NSDictionary * data = nil;
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        data = (NSDictionary *)responseObject;
                    }
                    completion ? completion(data, responseError) : nil;
                }] resume];
}

- (void)getObjectAt:(NSString *)url params:(NSDictionary *)params
           complete:(void (^)(NSDictionary *data, NSError *error))completion {
    NSString * endPoint = [_configurations.baseAPIUrl stringByAppendingString:url];
    [self request:@"GET"
               at:endPoint
           params:params
         complete:completion];
}

- (void)postObjectAt:(NSString *)url params:(NSDictionary *)params
            complete:(void (^)(NSDictionary *data, NSError *error))completion {
    NSString * endPoint = [_configurations.baseAPIUrl stringByAppendingString:url];
    [self request:@"POST"
               at:endPoint
           params:params
         complete:completion];
}


@end
