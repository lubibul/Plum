//
//  PlumCardCell.m
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumCardCell.h"

@implementation PlumCardCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupCard
{
    self.mainView.layer.cornerRadius = 10;
//    self.mainView.layer.masksToBounds = YES;
    
    [self.mainView.layer setShadowColor:[UIColor colorWithWhite:0.75 alpha:1].CGColor];
    [self.mainView.layer setShadowOpacity:1.0];
    [self.mainView.layer setShadowRadius:0.0];
    [self.mainView.layer setShadowOffset:CGSizeMake(0.0, 5.0)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
