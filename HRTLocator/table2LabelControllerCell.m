//
//  table2LabelControllerCell.m
//  HRTLocator
//
//  Created by Jason on 10/16/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "table2LabelControllerCell.h"

@implementation table2LabelControllerCell

@synthesize label1;
@synthesize label2;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
