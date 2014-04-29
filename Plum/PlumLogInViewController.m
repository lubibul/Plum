//
//  PlumLogInViewController.m
//  Plum
//
//  Created by Lulu Tang on 4/29/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlumLogInViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PlumLogInViewController ()
@property (nonatomic, strong) UIImageView *fieldsBackground;
@end

@implementation PlumLogInViewController
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@synthesize fieldsBackground;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.logInView setBackgroundColor:UIColorFromRGB(0x9074a0)];
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginlogo.png"]]];
    
    // Set buttons appearance
    [self.logInView.logInButton setBackgroundImage:[UIImage imageNamed:@"Login.png"] forState:UIControlStateNormal];
    [self.logInView.logInButton setBackgroundImage:[UIImage imageNamed:@"LoginDown.png"] forState:UIControlStateHighlighted];
    
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"Signup.png"] forState:UIControlStateNormal];
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"SignupDown.png"] forState:UIControlStateHighlighted];
    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateNormal];
    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateHighlighted];
    
    // Add login field background
    fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginFieldBG.png"]];
    [self.logInView addSubview:self.fieldsBackground];
    [self.logInView sendSubviewToBack:self.fieldsBackground];
    
    // Remove text shadow
    CALayer *layer = self.logInView.usernameField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.logInView.passwordField.layer;
    layer.shadowOpacity = 0.0f;
    
    // Set field text color
    [self.logInView.usernameField setTextColor:[UIColor whiteColor]];
    [self.logInView.passwordField setTextColor:[UIColor whiteColor]];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.logInView.logInButton setTitle:@"" forState:UIControlStateNormal];
    [self.logInView.logInButton setTitle:@"" forState:UIControlStateHighlighted];
    
    // Set frame for elements
//    [self.logInView.dismissButton setFrame:CGRectMake(10.0f, 10.0f, 87.5f, 45.5f)];
    [self.logInView.logo setFrame:CGRectMake(66.5f, 70.0f, 187.0f, 58.5f)];
    [self.logInView.signUpButton setFrame:CGRectMake(35.0f, 340.0f, 250.0f, 40.0f)];
    [self.logInView.logInButton setFrame:CGRectMake(35.0f, 285.0f, 250.0f, 40.0f)];
    [self.logInView.usernameField setFrame:CGRectMake(35.0f, 145.0f, 250.0f, 50.0f)];
    [self.logInView.passwordField setFrame:CGRectMake(35.0f, 195.0f, 250.0f, 50.0f)];
    [self.fieldsBackground setFrame:CGRectMake(35.0f, 145.0f, 250.0f, 100.0f)];
    [self.logInView.passwordForgottenButton setFrame:CGRectMake(25.0f, 195.0f, 0.0f, 0.0f)];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
