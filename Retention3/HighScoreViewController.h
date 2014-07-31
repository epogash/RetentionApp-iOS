//
//  HighScoreViewController.h
//  NumbersGame
//
//  Created by Eric Pogash on 5/14/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface HighScoreViewController : UIViewController
@property (strong, nonatomic) UILabel *highestLevelLabel;
@property (strong, nonatomic) NSNumber *highScore;
@end
