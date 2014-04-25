//
//  TradingCardCell.m
//  Plum
//
//  Created by Lulu Tang on 4/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "TradingCardCell.h"

@implementation TradingCardCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupTradingCardWithImage:(NSString *)image
{
    [self setupCard];
    
    self.tradingPicture.image = [UIImage imageNamed:image];
}

@end
