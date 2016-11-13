//
// Created by Nguyen Thanh Hai on 11/13/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "SigninViewMock.h"


@implementation SigninViewMock

- (void)preventUserInteractor {
    _enableUserInteration = NO;
}

- (void)allowUserInteractor {

}

- (void)changeLoginButtonState:(BOOL)enable {
    _enableSignInButton = enable;
}


@end