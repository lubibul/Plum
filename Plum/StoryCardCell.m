//
//  StoryCardCell.m
//  Plum
//
//  Created by Lulu Tang on 4/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "StoryCardCell.h"

@implementation StoryCardCell

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setupStoryCardWithTitle:(NSString *)title
                     withAuthor:(NSString *)author
                    withPreview:(NSString *)preview
{
    [self setupCard];
    
    self.storyReadMoreLabel.backgroundColor = (UIColorFromRGB(0xeeeaf1));
    self.storyReadMoreLabel.textColor = (UIColorFromRGB(0x9074a0));
    
    self.storyTitle.text = title;
    self.storyAuthor.text = author;
    self.storyPreview.text = preview;

    self.storyReadMoreLabel.layer.masksToBounds = YES;
    self.storyReadMoreLabel.layer.cornerRadius = 10;

}


@end
