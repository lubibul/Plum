//
//  PlumMasterViewController.m
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "CollectionViewController.h"
#import "SWRevealViewController.h"
#import "PlumCardCell.h"
#import "TradingCardCell.h"
#import "StoryCardCell.h"
#import "ChapterDetailView.h"
#import "TradingCardDetailView.h"

#import <Parse/Parse.h>

@interface CollectionViewController ()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation CollectionViewController

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // custom initialization
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
    _sidebarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"]
                                                      style:UIBarButtonItemStylePlain
                                                     target:self.revealViewController
                                                     action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = _sidebarButton;
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.tableView.backgroundColor = UIColorFromRGB(0xdedede);
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"collectiontitle.png"]];
    
    if (!self.cards) {
        self.cards = [[NSMutableArray alloc] init];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // set navigation bar's tint color when being shown
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x75b4ce);
    
    PFUser *currentUser = [PFUser currentUser];
    PFRelation *relation;
    relation = [currentUser relationforKey:@"collected"];
    
    PFQuery *query = [relation query];
    [query includeKey:@"tradingCardPointer"];
    [query includeKey:@"chapterPointer"];
    [query findObjectsInBackgroundWithTarget:self selector:@selector(findCollectedCards:error:)];
}
- (void)findCollectedCards:(NSArray *)objects error:(NSError *)error {
    if (!error) {
        // The find succeeded.
        NSLog(@"Successfully retrieved %d cards.", (int)objects.count);
        [self.cards removeAllObjects];
        for (PFObject *object in objects) {
            [self.cards addObject:object];
        }
        [self.tableView reloadData];
        
        if ([self.cards count] == 0) {
            UIAlertView *alert = [UIAlertView alloc];
            alert.title = @"Ooh!";
            alert.message = @"Looks like you haven't collected any cards yet! Click on the plus button on any card from today to add it to your collection.";
            [alert addButtonWithTitle:@"Neat!"];
            [alert show];
        }
    } else {
        // Log details of the failure
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
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
    return [self.cards count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    
    PFObject *myCard = [self.cards objectAtIndex:indexPath.row];
    
    if ([myCard[@"type"] isEqualToString:@"chapter"]) {
        CellIdentifier = @"StoryCard";
    } else {
        CellIdentifier = @"TradingCard";
    }
    
    NSLog(@"Setting up cell %d", indexPath.row);
    
    if ([CellIdentifier isEqualToString:@"TradingCard"]) {
        TradingCardCell *cell = (TradingCardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TradingCardCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        PFObject *tradingCard = myCard[@"tradingCardPointer"];
        
        [cell setupTradingCardWithFile:tradingCard[@"pictureFile"]
                              withName:tradingCard[@"name"]
                          withSubtitle:tradingCard[@"subtitle"]
                       withDescription:tradingCard[@"description1"]];
        
        return cell;
    } else if ([CellIdentifier isEqualToString:@"StoryCard"]) {
        StoryCardCell *cell = (StoryCardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"StoryCardCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        PFObject *chapter = myCard[@"chapterPointer"];
        [cell setupStoryCardWithTitle:chapter[@"title"]
                           withAuthor:chapter[@"author"]
                          withPreview:chapter[@"preview"]];
        
        return cell;
    }
    
    StoryCardCell *dummycell = (StoryCardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    return dummycell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *myCard = [self.cards objectAtIndex:indexPath.row];
    
    if ([myCard[@"type"] isEqualToString:@"chapter"]) {
        [self performSegueWithIdentifier:@"storyDetail" sender:self];
    } else {
        [self performSegueWithIdentifier:@"tradingDetail" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set the add bar button action.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"delete.png"]
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(removeCard:)];
    
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.navigationItem.rightBarButtonItem = addButton;
    
    if ([[segue identifier] isEqualToString:@"storyDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *card = self.cards[indexPath.row];
        PFObject *chapter = card[@"chapterPointer"];
        [[segue destinationViewController] setDetailItem:chapter];
    } else {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *card = self.cards[indexPath.row];
        PFObject *chapter = card[@"tradingCardPointer"];
        [[segue destinationViewController] setDetailItem:chapter];
    }
}

- (IBAction)removeCard:(id)sender
{
    UIAlertView *alert = [UIAlertView alloc];
    alert.title = @"Whoa!";
    alert.message = @"Are you sure you want to remove this card from your collection? You can't collect cards from the past once they're gone.";
    alert.delegate = self;
    [alert addButtonWithTitle:@"Remove"];
    [alert addButtonWithTitle:@"Cancel"];
    [alert show];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0)
    {
        NSLog(@"remove");
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *myCard = [self.cards objectAtIndex:indexPath.row];
        PFUser *user = [PFUser currentUser];
        PFRelation *relation = [user relationforKey:@"collected"];
        [relation removeObject:myCard];
        [user saveInBackground];
    }
    else
    {
        NSLog(@"cancel");
    }
}
@end
