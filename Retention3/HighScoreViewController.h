//
//  HighScoreViewController.h
//  NumbersGame
//
//  Created by Eric Pogash on 5/14/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "ShareKit.h"

@interface HighScoreViewController : UIViewController
@property (strong, nonatomic) UILabel *highScoreTitleLabel;
@property (strong, nonatomic) UILabel *highestLevelTitleLabel;
@property (strong, nonatomic) UILabel *highScoreLabel;
@property (strong, nonatomic) UILabel *highestLevelLabel;

@property (strong, nonatomic) IBOutlet UIButton *shareHighScoreButton;
@property (nonatomic, strong) IBOutlet UILabel *label;
- (void)myButtonHandlerAction;

@end
