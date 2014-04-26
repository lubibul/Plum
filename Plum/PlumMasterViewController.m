//
//  PlumMasterViewController.m
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumMasterViewController.h"
#import "SWRevealViewController.h"
#import "PlumCardCell.h"
#import "TradingCardCell.h"
#import "StoryCardCell.h"
#import "PlumDetailViewController.h"

@interface PlumMasterViewController () {
    NSMutableArray *cards;
}
@end

@implementation PlumMasterViewController

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
//        [self.tableView registerClass:[TradingCardCell class] forCellReuseIdentifier:@"TradingCard"];
//        [self.tableView registerClass:[StoryCardCell class] forCellReuseIdentifier:@"StoryCard"];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    if (!cards) {
        cards = [[NSMutableArray alloc] init];
    }
    
    [cards addObject:@"Anna"];
    [cards addObject:@"Bob"];
    [cards addObject:@"Casey"];
    NSLog(@"We have %d cards", cards.count);

    self.tableView.backgroundColor = UIColorFromRGB(0xdedede);
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plum_logo.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cards.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    
    if ([[cards objectAtIndex:indexPath.row] isEqualToString:@"Anna"]) {
        CellIdentifier = @"TradingCard";
    } else {
        CellIdentifier = @"StoryCard";
    }
    
    NSLog(@"Setting up cell %d", indexPath.row);
    
    if ([CellIdentifier isEqualToString:@"TradingCard"]) {
        TradingCardCell *cell = (TradingCardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TradingCardCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        [cell setupTradingCardWithImage:@"dolrea.png"
                               withName:@"Dolrea"
                           withSubtitle:@"Eye Type"
                        withDescription:@"The Dolrea is a land creature that enjoys hot days in the sun and cool baths in the evening."];
        return cell;
    } else {
        StoryCardCell *cell = (StoryCardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"StoryCardCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        [cell setupStoryCardWithTitle:@"Fishbones: Chapter 1"
                           withAuthor:@"Jisuk Cho"
                          withPreview:@"Ferris was running.\nHe didn’t run very often and wasn’t what one would call ‘good at it.’ He had only been running for a few blocks and could already feel his legs protesting. Of course, he wasn’t dressed for the occasion, nor had he woken up with a fist in his palm and the firm intent to go for a few laps around his neighborhood. In fact, the only reason that his shoes were pounding so hard against the wet pavement, that his sweater was starting to make him sweat, and that his scarf had fluttered off into a gutter ten yards back, was that he was being chased."];
        
        return cell;
    }    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [cards removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = cards[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
