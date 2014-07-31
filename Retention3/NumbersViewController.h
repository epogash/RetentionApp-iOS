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

@interface NumbersViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}
@property (nonatomic, strong) NSNumber *highScore;
@property (nonatomic, strong) NSMutableArray *randomNumbersArray;
@property (nonatomic, strong) NSMutableArray *numbersTappedArray;
@property (nonatomic, strong) UIButton *mainMenuButton;
@property (strong, nonatomic) UILabel *getReadyLabel;
@property (strong, nonatomic) UILabel *countdownLabel;
@property (strong, nonatomic) UILabel *levelLabel;
@property (strong, nonatomic) UILabel *levelNumberLabel;
@property (strong, nonatomic) UILabel *numberOfDigitsLeftToDisplay;
@property (strong, nonatomic) UILabel *tapNumbersLabel;
@property (strong, nonatomic) FocusView *horizontal1;
@property (strong, nonatomic) FocusView *horizontal2;
@property (strong, nonatomic) FocusView *vertical1;
@property (strong, nonatomic) FocusView *vertical2;
-(void) addFocus;
-(void) generateNumbers:(NSTimer *) timer;
-(void) displayRandomNumbers;
- (IBAction) myClickEvent:(id)sender event:(id)event;
@end
