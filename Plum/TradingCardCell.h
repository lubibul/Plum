//
//  TradingCardCell.h
//  Plum
//
//  Created by Lulu Tang on 4/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumCardCell.h"
#import <Parse/Parse.h>

@interface TradingCardCell : PlumCardCell
@property (strong, nonatomic) IBOutlet PFImageView *tradingPicture;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)setupTradingCardWithFile:(PFFile *)file
                         withName:(NSString *)name
                     withSubtitle:(NSString *)subtitle
                  withDescription:(NSString *)description;
@end
