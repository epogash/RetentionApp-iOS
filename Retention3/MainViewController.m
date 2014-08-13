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
@synthesize highestLevel;
@synthesize label;

- (void)viewDidLoad
{
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
//    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:250.0/255.0 green:219.0/255.0 blue:63.0/255.0 alpha:1.0]  CGColor], (id)[[UIColor colorWithRed:230.0/255.0 green:85.0/255.0 blue:47.0/255.0 alpha:1.0]  CGColor], nil];
//    [self.view.layer insertSublayer:gradient atIndex:0];
    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    if(!highestLevel){
        highestLevel = [NSNumber numberWithInt:0];
    }
   
    
    [super viewDidLoad];
    
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc]
     initWithAttributedString: label.attributedText];
    
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor orangeColor]
                 range:NSMakeRange(1, 1)];
    [label setAttributedText: text];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)init
{
    self = [super initWithNibName:@"MainViewController" bundle:nil];
    if (self != nil)
    {
        // Further initialization if needed
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}

-(IBAction) thankDeveloperButtonTapped
{
   
}

@end
