//
//  NumbersViewController.h
//  NumbersGame
//
//  Created by Eric Pogash on 5/7/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FocusView.h"
#import "NumberpadCell.h"
#import "MainViewController.h"
#import "TimerView.h"
#import "PauseMenuAlertView.h"
#import "CustomButton.h"

@interface NumbersViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}
@property NSTimeInterval timeInterval;

@property (nonatomic, strong) NSNumber *highestLevel;
@property (nonatomic, strong) NSNumber *highestScore;
@property (nonatomic, strong) NSNumber *timerValue;
@property (nonatomic, strong) NSNumber *currentScore;

@property (nonatomic, strong) NSMutableArray *randomNumbersArray;
@property (nonatomic, strong) NSMutableArray *numbersTappedArray;
@property (nonatomic, strong) UIButton *mainMenuButton;
@property (nonatomic, strong) IBOutlet UIButton *secondMainMenuButton;

@property (strong, nonatomic) UILabel *getReadyLabel;
@property (strong, nonatomic) UILabel *countdownLabel;
@property (strong, nonatomic) UILabel *levelLabel;
@property (strong, nonatomic) UILabel *levelNumberLabel;
@property (strong, nonatomic) UILabel *numberOfDigitsLeftToDisplay;
@property (strong, nonatomic) UILabel *tapNumbersLabel;
@property (strong, nonatomic) UILabel *livesLabel;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UILabel *highestScoreLabel;

@property (strong, nonatomic) FocusView *horizontal1;
@property (strong, nonatomic) FocusView *horizontal2;
@property (strong, nonatomic) FocusView *vertical1;
@property (strong, nonatomic) FocusView *vertical2;
@property (strong, nonatomic) UIImageView *imageHolder;

@property (strong, nonatomic) TimerView *timerView;
@property (strong, nonatomic) NSTimer* highScoreTimer;
@property (strong, retain) NSTimer* countDownTimer;

@property (strong, nonatomic) NSUserDefaults *defaults;

@property (nonatomic, strong) IBOutlet UIButton *pauseCountdownButton;

@property (nonatomic, strong) UIView* dimView;

@property (nonatomic, strong) CustomButton* pauseMainMenuButton;
@property (nonatomic, strong) CustomButton* closeButton;

@property (nonatomic, strong) PauseMenuAlertView *pauseMenu;
@property (nonatomic, strong) PauseMenuAlertView *areYouSureView;

@property (nonatomic, strong) UILabel* areYouSureLabel;

@property (nonatomic, strong) CustomButton* yesButton;
@property (nonatomic, strong) CustomButton* noButton;

-(void) addFocus;
-(void) generateNumbers:(NSTimer *) timer;
-(void) displayRandomNumbers;
- (IBAction) myClickEvent:(id)sender event:(id)event;
- (IBAction) stopAndStartCountdownTimer;
- (IBAction) secondMainMenuButtonSelected;

@end
