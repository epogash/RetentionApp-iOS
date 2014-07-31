//
//  HighScoreViewController.m
//  NumbersGame
//
//  Created by Eric Pogash on 5/14/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "HighScoreViewController.h"

@interface HighScoreViewController ()

@end
@implementation HighScoreViewController
@synthesize highestLevelLabel;
@synthesize highScoreLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
//    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:250.0/255.0 green:219.0/255.0 blue:63.0/255.0 alpha:1.0]  CGColor], (id)[[UIColor colorWithRed:230.0/255.0 green:85.0/255.0 blue:47.0/255.0 alpha:1.0]  CGColor], nil];
//    [self.view.layer insertSublayer:gradient atIndex:0];
    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *highScore = [defaults valueForKey:@"highestScore"];
    NSNumber *highestLevel = [defaults valueForKey:@"highestLevel"];
    
    highScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/3, [[UIScreen mainScreen] bounds].size.width, 20)];
    highScoreLabel.textAlignment = NSTextAlignmentCenter;
    highScoreLabel.text = [NSString stringWithFormat:@"%d", [highScore intValue]];
    [self.view addSubview:highScoreLabel];
    
    highestLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1.7*[[UIScreen mainScreen] bounds].size.height/3, [[UIScreen mainScreen] bounds].size.width, 20)];
    highestLevelLabel.textAlignment = NSTextAlignmentCenter;
    highestLevelLabel.text = [NSString stringWithFormat:@"%d", [highestLevel intValue]];
    [self.view addSubview:highestLevelLabel];
    
    [self.shareHighScoreButton addTarget:self action:@selector(myButtonHandlerAction) forControlEvents:UIControlEventTouchUpInside];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myButtonHandlerAction
{
	// Create the item to share (in this example, a url)
	NSURL *url = [NSURL URLWithString:@"http://getsharekit.com"];
	SHKItem *item = [SHKItem URL:url title:@"ShareKit is Awesome!"];
    
	// Get the ShareKit action sheet
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	// Display the action sheet
	[actionSheet showInView:self.view];
}


@end
