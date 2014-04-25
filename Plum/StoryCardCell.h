//
//  StoryCardCell.h
//  Plum
//
//  Created by Lulu Tang on 4/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumCardCell.h"

@interface StoryCardCell : PlumCardCell
@property (strong, nonatomic) IBOutlet UILabel *storyTitle;
@property (strong, nonatomic) IBOutlet UILabel *storyPreview;

- (void)setupStoryCardWithTitle:(NSString *)title withPreview:(NSString *)preview;
@end
