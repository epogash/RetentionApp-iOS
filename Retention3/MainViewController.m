//
//  ViewController.m
//  NumbersGame
//
//  Created by Eric Pogash on 4/27/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize highScore;

- (void)viewDidLoad
{
    if(!highScore){
        highScore = [NSNumber numberWithInt:0];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"highScoreSegue"])
    {
        HighScoreViewController *controller = (HighScoreViewController *)segue.destinationViewController;
        controller.highScore = highScore;
    } /*else if([segue.identifier isEqualToString:@"startButtonSegue"]) {
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.highScore = highScore;
    }*/
}
@end
