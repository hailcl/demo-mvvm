//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "Storyboards.h"

@implementation Storyboards

- (UIStoryboard *)main {
    if (_main == nil) {
        _main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }

    return _main;
}

@end