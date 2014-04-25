//
//  TradingCardCell.h
//  Plum
//
//  Created by Lulu Tang on 4/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumCardCell.h"

@interface TradingCardCell : PlumCardCell
@property (weak, nonatomic) IBOutlet UIImageView *tradingPicture;

- (void)setupTradingCardWithImage:(NSString *)image;
@end
