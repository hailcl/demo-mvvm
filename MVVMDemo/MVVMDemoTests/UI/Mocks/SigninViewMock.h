//
// Created by Nguyen Thanh Hai on 11/13/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SigninViewModel.h"

@interface SigninViewMock : NSObject <SigninView>

@property (nonatomic, assign) BOOL enableSignInButton;

@property(nonatomic) BOOL enableUserInteration;
@end