//
//  TradingCardCell.m
//  Plum
//
//  Created by Lulu Tang on 4/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "TradingCardCell.h"

@implementation TradingCardCell

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupTradingCardWithImage:(UIImage *)image
                         withName:(NSString *)name
                     withSubtitle:(NSString *)subtitle
                  withDescription:(NSString *)description
{
    [self setupCard];
    
    self.tradingPicture.backgroundColor = (UIColorFromRGB(0xf1f1f1));
//    self.tradingPicture.image = image;
    
    self.nameLabel.text = name;
    self.subtitleLabel.text = subtitle;
    self.descriptionLabel.text = description;
}

@end
