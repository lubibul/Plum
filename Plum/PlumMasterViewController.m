//
//  PlumMasterViewController.m
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumMasterViewController.h"
#import "PlumCardCell.h"
#import "TradingCardCell.h"
#import "StoryCardCell.h"
#import "PlumDetailViewController.h"

@interface PlumMasterViewController () {
    NSMutableArray *cards;
}
@end

@implementation PlumMasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        [self.tableView registerClass:[TradingCardCell class] forCellReuseIdentifier:@"TradingCard"];
        [self.tableView registerClass:[StoryCardCell class] forCellReuseIdentifier:@"StoryCard"];
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
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    if (!cards) {
        cards = [[NSMutableArray alloc] init];
    }
    
    [cards addObject:@"Anna"];
    [cards addObject:@"Bob"];
    [cards addObject:@"Casey"];
    NSLog(@"We have %d cards", cards.count);

    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
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
        TradingCardCell *cell = (TradingCardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                                             forIndexPath:indexPath];
        [cell setupTradingCardWithImage:@"anna.jpg"];
        return cell;
    } else {
        StoryCardCell *cell = (StoryCardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                                                   forIndexPath:indexPath];
        [cell setupStoryCardWithTitle:@"LuluStory" withPreview:@"Donut lemon drops toffee dragée tiramisu. Jelly tiramisu liquorice candy. Topping candy canes macaroon dessert gummi bears cookie marzipan. Carrot cake chocolate marzipan gummies. Sesame snaps topping bear claw. Soufflé wafer wafer donut cupcake sesame snaps. Tootsie roll toffee jelly beans jelly-o. Macaroon lemon drops cookie icing cake. Lollipop marshmallow cupcake jelly toffee gummi bears lemon drops donut. Jelly beans caramels cookie croissant. Donut muffin tootsie roll unerdwear.com. Pie donut tiramisu dragée. Macaroon lollipop bear claw. Gummi bears candy carrot cake chocolate bar gingerbread caramels. Bonbon oat cake marzipan gingerbread cake sesame snaps."];
        
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
