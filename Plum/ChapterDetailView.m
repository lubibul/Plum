//
//  PlumDetailViewController.m
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "ChapterDetailView.h"
#import <Parse/Parse.h>

@interface ChapterDetailView ()
- (void)configureView;
@end

@implementation ChapterDetailView

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    // takes in a PFObject
    PFObject *chapter = (PFObject *)newDetailItem;
    [self setTitle:chapter[@"title"] setAuthor:chapter[@"author"] setContent:chapter[@"content"]];
}

- (void)setTitle:(NSString *)title
       setAuthor:(NSString *)author
      setContent:(NSString *)content
{

    if (_titleItem != title) {
        _titleItem = title;
        _authorItem = author;
        _contentItem = content;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.titleItem) {
        self.titleLabel.text = self.titleItem;
        self.authorLabel.text = self.authorItem;
        self.chapterContent.text = self.contentItem;
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
