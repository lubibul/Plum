//
//  PlumAppDelegate.m
//  Plum
//
//  Created by Lulu Tang on 4/24/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumAppDelegate.h"
#import <Parse/Parse.h>

@implementation PlumAppDelegate

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:91.0/255.0 green:169.0/255.0 blue:153.0/255.0 alpha:1.0]];
    
    [Parse setApplicationId:@"98r6Bz4HgpgkeOr24q8qnY9EyYTEjnQbSwfMQg3C"
                  clientKey:@"2L3inoFpcPifeyDl7zpBvcCJSXP4FJnVk1SwFvf5"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x9074a0)];

//    PFObject *newTradingCard = [PFObject objectWithClassName:@"TradingCard"];
//    newTradingCard[@"name"] = @"Dolrea";
//    newTradingCard[@"subtitle"] = @"Eye Type";
//    newTradingCard[@"description1"] = @"The Dolrea is a land creature that enjoys hot days in the sun and cool baths in the evening.";
//    UIImage *image;
//    image = [UIImage imageNamed:@"dolrea.png"];
//    NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
//    PFFile *imageFile = [PFFile fileWithName:@"dolrea.png" data:imageData];
//    newTradingCard[@"pictureFile"] = imageFile;
//    
//    [newTradingCard saveInBackground];
    
//    PFObject *newChapter = [PFObject objectWithClassName:@"Chapter"];
//    newChapter[@"title"] = @"Fishbones: Chapter 1";
//    newChapter[@"author"] = @"Jisuk Cho";
//    newChapter[@"preview"] = @"Ferris was running.\nHe didn’t run very often and wasn’t what one would call ‘good at it.’ He had only been running for a few blocks and could already feel his legs protesting. Of course, he wasn’t dressed for the occasion, nor had he woken up with a fist in his palm and the firm intent to go for a few laps around his neighborhood. In fact, the only reason that his shoes were pounding so hard against the wet pavement, that his sweater was starting to make him sweat, and that his scarf had fluttered off into a gutter ten yards back, was that he was being chased.";
//    newChapter[@"content"] = @"THIS IS A BUNCH OF CHAPTER CONTENT";
//    [newChapter saveInBackground];
//    
//    PFObject *newCard = [PFObject objectWithClassName:@"Card"];
//    newCard[@"type"] = @"story";
//
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"MM-dd-yyyy"];
//    NSDate *showDate = [formatter dateFromString:@"04-27-2014"];
//    newCard[@"showDate"] = showDate;
//    
//    newCard[@"content"] = newChapter;
//    
//    [newCard saveInBackground];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
