//
//  PlumDetailViewController.h
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlumDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
