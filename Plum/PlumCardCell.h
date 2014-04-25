//
//  PlumCardCell.h
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlumCardCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *mainView;

- (void)setupCard;

@end
