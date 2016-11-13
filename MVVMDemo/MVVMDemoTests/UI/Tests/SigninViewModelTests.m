//
// Created by Nguyen Thanh Hai on 11/13/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "SigninViewModelTests.h"
#import "SigninViewModel.h"
#import "SigninViewMock.h"
#import "UserServiceMock.h"
#import "LoginParams.h"

@implementation SigninViewModelTests
- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testEmptyPwdUsr {
    SigninViewMock * view = [SigninViewMock new];
    view.enableSignInButton = YES;
    NSObject <UserService>* userService = [UserServiceMock new];
    SigninViewModel * model = [[SigninViewModel alloc] initWithView:view
                                                        userService:userService];

    [model changeUsername:@""];
    [model changePassword:@""];

    XCTAssertFalse(view.enableSignInButton, @"Should disable signin button when usr/pwd empty");
}

- (void)testInvalidPwdLength {
    SigninViewMock * view = [SigninViewMock new];
    view.enableSignInButton = YES;
    NSObject <UserService>* userService = [UserServiceMock new];
    SigninViewModel * model = [[SigninViewModel alloc] initWithView:view
                                                        userService:userService];

    [model changeUsername:@"user@test.com"];
    [model changePassword:@"12345"];

    XCTAssertFalse(view.enableSignInButton, @"Should disable signin button when pwd length is not correct");
}

- (void)testInvalidUsrFormat {
    SigninViewMock * view = [SigninViewMock new];
    view.enableSignInButton = YES;
    NSObject <UserService>* userService = [UserServiceMock new];
    SigninViewModel * model = [[SigninViewModel alloc] initWithView:view
                                                        userService:userService];

    [model changeUsername:@"usertest.com"];
    [model changePassword:@"123456"];

    XCTAssertFalse(view.enableSignInButton, @"Should disable signin button when usr is wrong format");
}

- (void)testValidUsrPwd {
    SigninViewMock * view = [SigninViewMock new];
    view.enableSignInButton = NO;
    NSObject <UserService>* userService = [UserServiceMock new];
    SigninViewModel * model = [[SigninViewModel alloc] initWithView:view
                                                        userService:userService];

    [model changeUsername:@"user@test.com"];
    [model changePassword:@"123456"];

    XCTAssertTrue(view.enableSignInButton, @"Should enable signin button when usr/pwd valid");
}

- (void)testDisallowUserInteraction {
    SigninViewMock * view = [SigninViewMock new];
    view.enableUserInteration = YES;
    NSObject <UserService>* userService = [UserServiceMock new];
    SigninViewModel * model = [[SigninViewModel alloc] initWithView:view
                                                        userService:userService];

    [model changeUsername:@"user@test.com"];
    [model changePassword:@"123456"];
    [model login];

    XCTAssertFalse(view.enableUserInteration, @"Should disable user interaction when signing...");
}

- (void)testCallSignInServiceWithParams {
    SigninViewMock * view = [SigninViewMock new];
    UserServiceMock * userService = [UserServiceMock new];
    userService.calledSignIn = NO;
    SigninViewModel * model = [[SigninViewModel alloc] initWithView:view
                                                        userService:userService];

    LoginParams * params = [[LoginParams alloc] init];
    params.username = @"sieunhangao@gmail.com";

    [model changeUsername:params.username];
    [model changePassword:@"123456"];
    [model login];

    XCTAssertTrue(userService.calledSignIn, @"Must call sign service...");
    XCTAssertEqual(params.username, userService.params.username, @"Must call login without modify Login Params");
}

@end