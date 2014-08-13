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

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)

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
        NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
        [defaults setValue:@"3" forKey:@"livesRemaining"];
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.timeInterval = 0.40;
    } else if([segue.identifier isEqualToString:@"intermediateSegue"]) {
        NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
        [defaults setValue:@"3" forKey:@"livesRemaining"];
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.timeInterval = 0.30;
    } else if([segue.identifier isEqualToString:@"advancedSegue"]) {
        NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
        [defaults setValue:@"3" forKey:@"livesRemaining"];
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.timeInterval = 0.20;
    } else if([segue.identifier isEqualToString:@"hardcoreModeSegue"]) {
        NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
        [defaults setValue:@"1" forKey:@"livesRemaining"];
        NumbersViewController *controller = (NumbersViewController *)segue.destinationViewController;
        controller.timeInterval = 0.17;
    }
}
- (void)viewWillAppear
{
    
}

- (void)viewDidLoad
{
    [self determineAndAddConstraints];
    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) hardcoreButtonPressed
{
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults valueForKey:@"hardcoreModeUnlocked"]) {
        [self performSegueWithIdentifier:@"hardcoreModeSegue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"purchaseSegue" sender:self];
    }
}
- (void) determineAndAddConstraints {
    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height == 568)
        {
            [self addConstraintsFor4Inch];
        }
        else
        {
            [self addConstraintsFor3_5Inch];
        }
    }
}

-(void) addConstraintsFor3_5Inch {
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.beginnerButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-330.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.intermediateButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-251.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.advancedButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-172.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.hardcoreButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-93.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-28.0)]];
}

-(void) addConstraintsFor4Inch {
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.beginnerButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-400.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.intermediateButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-300.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.advancedButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-200.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.hardcoreButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-100.0)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeBottom relatedBy:0 toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(-30.0)]];
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
