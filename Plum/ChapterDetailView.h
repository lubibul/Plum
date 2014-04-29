//
//  ChapterDetailView.h
//  Plum
//
//  Created by Lulu Tang on 4/27/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChapterDetailView : UIViewController
@property (strong, nonatomic) NSString *titleItem;
@property (strong, nonatomic) NSString *authorItem;
@property (strong, nonatomic) NSString *contentItem;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic) IBOutlet UITextView *chapterContent;


@end
