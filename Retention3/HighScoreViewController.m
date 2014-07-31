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
@synthesize highScore;
@synthesize highestLevelLabel;

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

    highestLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/2, [[UIScreen mainScreen] bounds].size.width, 20)];
    highestLevelLabel.textAlignment = NSTextAlignmentCenter;
    highestLevelLabel.text = [NSString stringWithFormat:@"%d", [highScore intValue]];
    [self.view addSubview:highestLevelLabel];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"highScoreSegue"])
    {
        MainViewController *controller = (MainViewController *)segue.destinationViewController;
        controller.highScore = highScore;
    }
}

@end
