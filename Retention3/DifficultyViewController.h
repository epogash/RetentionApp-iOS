//
//  DifficultyViewController.h
//  Retention3
//
//  Created by Eric Pogash on 6/18/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumbersViewController.h"

@interface DifficultyViewController : UIViewController
@property NSTimeInterval timeInterval;

@property (nonatomic, strong) IBOutlet UIButton *beginnerButton;
@property (nonatomic, strong) IBOutlet UIButton *intermediateButton;
@property (nonatomic, strong) IBOutlet UIButton *advancedButton;
@property (nonatomic, strong) IBOutlet UIButton *hardcoreButton;
@property (nonatomic, strong) IBOutlet UIButton *backButton;
-(void) determineAndAddConstraints;
- (IBAction) hardcoreButtonPressed;

@end
