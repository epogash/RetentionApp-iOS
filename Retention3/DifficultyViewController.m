//
//  DifficultyViewController.m
//  Retention3
//
//  Created by Eric Pogash on 6/18/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "DifficultyViewController.h"

@interface DifficultyViewController ()

@end

@implementation DifficultyViewController
@synthesize timeInterval;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if([segue.identifier isEqualToString:@"beginnerSegue"])
    {
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.timeInterval = 0.40;
    } else if([segue.identifier isEqualToString:@"intermediateSegue"]) {
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.timeInterval = 0.30;
    } else if([segue.identifier isEqualToString:@"advancedSegue"]) {
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.timeInterval = 0.20;
    }
}

- (void)viewDidLoad
{
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
//    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:250.0/255.0 green:219.0/255.0 blue:63.0/255.0 alpha:1.0]  CGColor], (id)[[UIColor colorWithRed:230.0/255.0 green:85.0/255.0 blue:47.0/255.0 alpha:1.0]  CGColor], nil];
//    [self.view.layer insertSublayer:gradient atIndex:0];
    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
