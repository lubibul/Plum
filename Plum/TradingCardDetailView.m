//
//  PlumDetailViewController.m
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "TradingCardDetailView.h"

@interface TradingCardDetailView ()
- (void)configureView;
@end

@implementation TradingCardDetailView

#pragma mark - Managing the detail item

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (void)setDetailItem:(id)newDetailItem
{
    // takes in a PFObject
    PFObject *trading = (PFObject *)newDetailItem;
    [self setFile:trading[@"pictureFile"]
          setName:trading[@"name"]
      setSubtitle:trading[@"subtitle"]
   setDescription:trading[@"description1"]];
}

- (void)setFile:(PFFile *)file
        setName:(NSString *)name
    setSubtitle:(NSString *)subtitle
 setDescription:(NSString *)description{
    
    if (_name != name) {
        NSLog(@"got here");
        _file = file;
        _name = name;
        _subtitle = subtitle;
        _description = description;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.name) {
        NSLog(@"got here");
        if (!self.tradingPicture) self.tradingPicture = [[PFImageView alloc] init];
        self.tradingPicture.image = [UIImage imageNamed:@"trading_card_placeholder.png"]; // placeholder image
        self.tradingPicture.file = _file;
        [self.tradingPicture loadInBackground];
        self.tradingPicture.backgroundColor = (UIColorFromRGB(0xf1f1f1));

        self.nameLabel.text = _name;
        self.subtitleLabel.text = _subtitle;
        self.descriptionLabel.text = _description;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
