//
//  ChapterDetailView.h
//  Plum
//
//  Created by Lulu Tang on 4/27/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChapterDetailView : UIViewController
@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *chapterContentLabel;

@end
