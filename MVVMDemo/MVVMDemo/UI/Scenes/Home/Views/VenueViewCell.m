//
// Created by Nguyen Thanh Hai on 11/10/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenueViewCell.h"
#import "VenueViewModel.h"


@implementation VenueViewCell

- (void)setModel:(VenueViewModel *)model {
    _nameLabel.text = model.name;
    _locationLabel.text = model.location;
}

@end