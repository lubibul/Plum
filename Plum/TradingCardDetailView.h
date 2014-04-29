//
//  ChapterDetailView.h
//  Plum
//
//  Created by Lulu Tang on 4/27/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TradingCardDetailView : UIViewController
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) PFFile *file;

@property (strong, nonatomic) IBOutlet PFImageView *tradingPicture;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)setDetailItem:(id)newDetailItem;
@end
