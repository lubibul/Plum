//
//  StoryCardCell.m
//  Plum
//
//  Created by Lulu Tang on 4/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "StoryCardCell.h"

@implementation StoryCardCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupStoryCardWithTitle:(NSString *)title withPreview:(NSString *)preview
{
    [self setupCard];
    
    self.storyTitle.text = title;
    self.storyPreview.text = preview;
}


@end
