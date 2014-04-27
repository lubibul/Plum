//
//  CardFlipSegue.m
//  Plum
//
//  Created by Lulu Tang on 4/27/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "CardFlipSegue.h"

@implementation CardFlipSegue

- (void) perform {
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [UIView transitionWithView:src.navigationController.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
                    completion:NULL];
}

@end
