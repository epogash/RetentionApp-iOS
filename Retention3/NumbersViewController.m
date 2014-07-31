//
//  NumbersViewController.m
//  NumbersGame
//
//  Created by Eric Pogash on 5/7/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "NumbersViewController.h"

@interface NumbersViewController ()

@end

@implementation NumbersViewController

@synthesize timeInterval;
@synthesize secondMainMenuButton;
@synthesize highestLevel;
@synthesize countdownLabel = _countdownLabel;
@synthesize levelLabel = _levelLabel;
@synthesize levelNumberLabel = _levelNumberLabel;
@synthesize numberOfDigitsLeftToDisplay = _numberOfDigitsLeftToDisplay;
@synthesize tapNumbersLabel = _tapNumbersLabel;
@synthesize horizontal1 = _horizontal1;
@synthesize horizontal2  = _horizontal2;
@synthesize vertical1 = _vertical1;
@synthesize vertical2 = _vertical2 ;
@synthesize mainMenuButton = _mainMenuButton;
@synthesize livesLabel = _livesLabel;
@synthesize highScoreTimer;
@synthesize timerView;
@synthesize scoreLabel;
@synthesize highestScoreLabel;
@synthesize highestScore;
@synthesize currentScore;
@synthesize defaults;
@synthesize timerValue;
@synthesize countDownTimer;
@synthesize dimView;
@synthesize closeButton;
@synthesize pauseMenu;
@synthesize pauseCountdownButton;
@synthesize pauseMainMenuButton;
@synthesize areYouSureView;
@synthesize areYouSureLabel;
@synthesize yesButton;
@synthesize noButton;

- (NSMutableArray *) randomNumbersArray
{
    if (!_randomNumbersArray) {
        _randomNumbersArray = [NSMutableArray new];
    }
    return _randomNumbersArray;
}
- (NSMutableArray *) numbersTappedArray
{
    if (!_numbersTappedArray) {
        _numbersTappedArray = [NSMutableArray new];
    }
    return _numbersTappedArray;
}
NSInteger const cellWidth = 90;
int i = 1;
int livesRemaining = 3;

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
    pauseCountdownButton.hidden = NO;
    pauseCountdownButton.enabled = YES;
    
    pauseMenu = [[PauseMenuAlertView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/4, [[UIScreen mainScreen] bounds].size.height/3.1, [[UIScreen mainScreen] bounds].size.width/2, 0.35483871*[[UIScreen mainScreen] bounds].size.height)];
    pauseMenu.layer.cornerRadius = 20;
    pauseMenu.layer.borderColor = [UIColor orangeColor].CGColor;
    pauseMenu.layer.borderWidth = 2.0f;
    pauseMenu.layer.masksToBounds = YES;
    
    areYouSureView = [[PauseMenuAlertView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/4, [[UIScreen mainScreen] bounds].size.height/3.1, [[UIScreen mainScreen] bounds].size.width/2, 0.2*[[UIScreen mainScreen] bounds].size.height)];
    areYouSureView.layer.cornerRadius = 20;
    areYouSureView.layer.borderColor = [UIColor orangeColor].CGColor;
    areYouSureView.layer.borderWidth = 2.0f;
    areYouSureView.layer.masksToBounds = YES;
    
    defaults =  [NSUserDefaults standardUserDefaults];
    highestScore = [defaults valueForKey:@"highestScore"];
    if(!highestScore) {
        highestScore = [NSNumber numberWithInt:0];
    }
    highestLevel = [defaults valueForKey:@"highestLevel"];
    if(!highestLevel){
        highestLevel = [NSNumber numberWithInt:0];
    }
    currentScore = [NSNumber numberWithInt:0];
    
    timerView = [[TimerView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/40, [[UIScreen mainScreen] bounds].size.height/15, 50, 50)];
    timerView.percent = 50;
    
    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [secondMainMenuButton setHidden:YES];
    secondMainMenuButton.enabled = NO;
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    //collectionView instantiation
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/4.5, [[UIScreen mainScreen] bounds].size.width, 4*[[UIScreen mainScreen] bounds].size.height/5) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView registerClass:[NumberpadCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    //getReadyLabel instantiation
    self.getReadyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/3.25, [[UIScreen mainScreen] bounds].size.width, 20)];
    self.getReadyLabel.text = @"Get Ready";
    self.getReadyLabel.textAlignment = NSTextAlignmentCenter;
    //tapNumbersLabel instantiation
    self.tapNumbersLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/10, [[UIScreen mainScreen] bounds].size.width, 80)];
    self.tapNumbersLabel.numberOfLines = 0;
    self.tapNumbersLabel.textAlignment = NSTextAlignmentCenter;
    //countdownLabel instantiation
    self.countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/2 - 40, [[UIScreen mainScreen] bounds].size.width, 30)];
    self.countdownLabel.textAlignment = NSTextAlignmentCenter;
    self.countdownLabel.text = @"3";
    self.countdownLabel.font = [UIFont systemFontOfSize:35.0];
    
    self.highestScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/1.3, [[UIScreen mainScreen] bounds].size.height/21, 50, 60)];
    self.highestScoreLabel.numberOfLines = 0;
    self.highestScoreLabel.adjustsFontSizeToFitWidth = NO;
    self.highestScoreLabel.textAlignment = NSTextAlignmentRight;
    self.highestScoreLabel.font = [UIFont systemFontOfSize:15.0];
    self.highestScoreLabel.text = [NSString stringWithFormat:@"Best:\n%@", highestScore];

    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/1.3, [[UIScreen mainScreen] bounds].size.height/9, 50, 60)];
    self.scoreLabel.numberOfLines = 0;
    self.scoreLabel.adjustsFontSizeToFitWidth = NO;
    self.scoreLabel.textAlignment = NSTextAlignmentRight;
    self.scoreLabel.font = [UIFont systemFontOfSize:15.0];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:\n%@", currentScore];
    
    //add subviews
    [self.view addSubview:self.countdownLabel];
    [self.view addSubview:self.getReadyLabel];
    //numberOfDigitsLeftToDisplay instantiation
    self.numberOfDigitsLeftToDisplay = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/3, [[UIScreen mainScreen] bounds].size.width, 20)];
    [super viewDidLoad];
    //NSTimer to start countdown
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
}
- (void) countdown:(NSTimer *) timer
{
    if([self.countdownLabel.text  isEqualToString: @"1"]){
        pauseCountdownButton.hidden = YES;
        pauseCountdownButton.enabled = NO;
        
        [timer invalidate];
        [self.countdownLabel removeFromSuperview];
        self.countdownLabel.text = @"" ;
        self.levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/15, [[UIScreen mainScreen] bounds].size.width, 20)];
        self.levelLabel.textAlignment = NSTextAlignmentCenter;
        self.levelLabel.text = [NSString stringWithFormat:@"Level: %d", i];
        [self.view addSubview:self.levelLabel];
        
        self.levelNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 + 30, 50, 20, 20)];
        self.levelNumberLabel.text = [NSString stringWithFormat:@"%d", i];
        
        self.getReadyLabel.text = @"Remember the numbers";
        
        [self addFocus];
        
        [self performSelector:@selector(displayRandomNumbers) withObject:nil afterDelay:1];
        
    } else {
        self.countdownLabel.text = [NSString stringWithFormat:@"%d",[self.countdownLabel.text  intValue] - 1];
    }
}

-(IBAction) stopAndStartCountdownTimer {
    pauseCountdownButton.hidden = YES;
    pauseCountdownButton.enabled = NO;
    
    [self.countDownTimer invalidate];
    self.countDownTimer = nil;
    [pauseMenu show];
    dimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    dimView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    [self.view addSubview:dimView];
    
    if(!pauseMainMenuButton) {
        pauseMainMenuButton = [[CustomButton alloc] initWithFrame:CGRectMake(pauseMenu.frame.size.width/3 - 29, pauseMenu.frame.size.width/3 - 20, pauseMenu.frame.size.width/3 + 40, 35)];
        [pauseMainMenuButton setTitle:@"Main Menu" forState:UIControlStateNormal];
        [pauseMainMenuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [pauseMainMenuButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [pauseMainMenuButton addTarget:self action:@selector(createAreYouSureView) forControlEvents:UIControlEventTouchUpInside];
        self.pauseMainMenuButton.titleLabel.shadowColor = [UIColor grayColor];

    }
    
    [self.pauseMenu addSubview:pauseMainMenuButton];
    
    if(!closeButton) {
        closeButton = [[CustomButton alloc] initWithFrame:CGRectMake(pauseMenu.frame.size.width/3 - 18, pauseMenu.frame.size.height - 90, pauseMenu.frame.size.width/3 + 20, 35)];
        [closeButton setTitle:@"Resume" forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [closeButton addTarget:self action:@selector(hidePauseMenu) forControlEvents:UIControlEventTouchUpInside];
        self.closeButton.titleLabel.shadowColor = [UIColor grayColor];
    }
    
    [self.pauseMenu addSubview:closeButton];
    
    [self.view addSubview:pauseMenu];
}

-(void) createAreYouSureView {
    [self.pauseMenu removeFromSuperview];
    
    if(!areYouSureLabel) {
        areYouSureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, areYouSureView.frame.size.width, 20)];
        areYouSureLabel.text = @"Are you sure?";
        areYouSureLabel.textAlignment = NSTextAlignmentCenter;
        areYouSureLabel.backgroundColor = [UIColor clearColor];
        [self.areYouSureView addSubview:areYouSureLabel];
    }
    
    if(!noButton) {
        noButton = [[CustomButton alloc] initWithFrame:CGRectMake(areYouSureView.frame.size.width/7.7, 2*areYouSureView.frame.size.height/4, areYouSureView.frame.size.width/3, 35)];
        [noButton setTitle:@"No" forState:UIControlStateNormal];
        [noButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [noButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [noButton addTarget:self action:@selector(hideAreYouSureView) forControlEvents:UIControlEventTouchUpInside];
        self.noButton.titleLabel.shadowColor = [UIColor grayColor];
    }
    
    if(!yesButton) {
        yesButton = [[CustomButton alloc] initWithFrame:CGRectMake(areYouSureView.frame.size.width/1.8, 2*areYouSureView.frame.size.height/4, areYouSureView.frame.size.width/3, 35)];
        [yesButton setTitle:@"Yes" forState:UIControlStateNormal];
        [yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [yesButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [yesButton addTarget:self action:@selector(goToMainMenu) forControlEvents:UIControlEventTouchUpInside];
        self.yesButton.titleLabel.shadowColor = [UIColor grayColor];
    }
    
    [self.areYouSureView addSubview:yesButton];
    [self.areYouSureView addSubview:noButton];
    
    [areYouSureView show];
    [self.view addSubview:areYouSureView];
}

-(void) hideAreYouSureView {
    [areYouSureView hide];
    [self.view addSubview:pauseMenu];
}

-(void) goToMainMenu {
    [self performSegueWithIdentifier:@"mainMenuSegue" sender:self];
}

- (void) hidePauseMenu {
    pauseCountdownButton.hidden = NO;
    pauseCountdownButton.enabled = YES;
    
    [self.pauseMenu hide];
    
    [self.dimView removeFromSuperview];
    
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
}

- (void) displayRandomNumbers
{
    //used to set number of digits-based on level number
    self.numberOfDigitsLeftToDisplay.text = self.levelNumberLabel.text;
    
    self.countdownLabel.textColor = [UIColor blackColor];
    self.countdownLabel.font = [UIFont systemFontOfSize:35.0];
    //speed at which to display the numbers, 0.25 is approx 250 WPM
    [self.numbersTappedArray removeAllObjects];
    [self.randomNumbersArray removeAllObjects];
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(generateNumbers:) userInfo:nil repeats:YES];
}
- (void) generateNumbers:(NSTimer *) timer
{
    
    [self.view addSubview:self.countdownLabel];
    
    
    if ([self.numberOfDigitsLeftToDisplay.text isEqualToString:@"0"]) {
        
        [timer invalidate];
        [self.countdownLabel removeFromSuperview];
        [self.getReadyLabel removeFromSuperview];
        [self.countdownLabel removeFromSuperview];
        [self.horizontal1 removeFromSuperview];
        [self.horizontal2 removeFromSuperview];
        [self.vertical1 removeFromSuperview];
        [self.vertical2 removeFromSuperview];
       
        //
        //first,display all numbers (0-9), then monitor touch events in order, starting with index 0 of randomNumbersArray.
        //(compare values touched with index of array).
        //use collection view?
        //need a way to have a variable increase by one to compare in order just do locally!
        self.imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2.4, [[UIScreen mainScreen] bounds].size.height/8.8, 20, 20)];
        UIImage *image = [UIImage imageNamed:@"HeartImage.jpg"];
        self.imageHolder.image = image;
        [self.view addSubview:self.imageHolder];
        
        self.livesLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/8.8, 40, 20)];
        self.livesLabel.text = [NSString stringWithFormat:@"X %d", livesRemaining];
        [self.view addSubview:self.livesLabel];
        
        [self.view addSubview:timerView];
        
        highScoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
        
        [self.view addSubview:_collectionView];
        [self.view addSubview:highestScoreLabel];
        [self.view addSubview:scoreLabel];
        //if only one number, print 'number' instead of 'numbers'
        if(self.randomNumbersArray.count == 1) {
             self.tapNumbersLabel.text = [NSString stringWithFormat:@"Tap the %d number", [self.levelNumberLabel.text intValue]];
        }
        else {
            self.tapNumbersLabel.text = [NSString stringWithFormat:@"Tap the %d numbers in order", [self.levelNumberLabel.text intValue]];
        }
        [self.view addSubview:self.tapNumbersLabel];
        
        //select all numbers by tapping them in order...
        
       // int i;
        
        
    } else {
        int num = arc4random_uniform(10);
        while ([[NSString stringWithFormat:@"%i", num] isEqualToString:self.countdownLabel.text] ) {
            num = arc4random_uniform(10);
        }
        //add random integer to beginning of array
        [self.randomNumbersArray addObject:[[NSNumber numberWithInt:num] stringValue]];
        self.countdownLabel.text = [NSString stringWithFormat:@"%d", num];
        self.numberOfDigitsLeftToDisplay.text = [NSString stringWithFormat:@"%d",[self.numberOfDigitsLeftToDisplay.text  intValue] - 1];
        //change cell background color to red or green (right or wrong respectively) on touch, change to clear after next button tapped, or after it is released?
        
    }
}

- (void)decrementSpin
{
    // If we can decrement our percentage, do so, and redraw the view
    if (timerView.percent > 1) {
        timerView.percent = timerView.percent - 1;
        [timerView setNeedsDisplay];
    }
    else {
        [highScoreTimer invalidate];
        [timerView setNeedsDisplay];
    }
}

- (void) addFocus
{
    //Draw 4 lines for to enable focus on the changing numbers.
    self.horizontal1 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.horizontal1.backgroundColor = [UIColor clearColor];
    self.horizontal1.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, 1.2*[[UIScreen mainScreen] bounds].size.width/4, [[UIScreen mainScreen] bounds].size.height/2 - 55);
        CGContextAddLineToPoint(context, 2.8*[[UIScreen mainScreen] bounds].size.width/4, [[UIScreen mainScreen] bounds].size.height/2 - 55);
        CGContextDrawPath(context, kCGPathStroke);
    };
    [self.view addSubview:self.horizontal1];
    
    self.horizontal2 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.horizontal2.backgroundColor = [UIColor clearColor];
    self.horizontal2.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, 1.2 *[[UIScreen mainScreen] bounds].size.width/4, [[UIScreen mainScreen] bounds].size.height/2 + 5);
        CGContextAddLineToPoint(context, 2.8*[[UIScreen mainScreen] bounds].size.width/4, [[UIScreen mainScreen] bounds].size.height/2 + 5);
        CGContextDrawPath(context, kCGPathStroke);
    };
    [self.view addSubview:self.horizontal2];
    
    self.vertical1 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.vertical1.backgroundColor = [UIColor clearColor];
    self.vertical1.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - 55);
        CGContextAddLineToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - 45);
        CGContextDrawPath(context, kCGPathStroke);
    };
    [self.view addSubview:self.vertical1];
    
    self.vertical2 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.vertical2.backgroundColor = [UIColor clearColor];
    self.vertical2.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2 + 5);
        CGContextAddLineToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - 5);
        CGContextDrawPath(context, kCGPathStroke);
    };
    [self.view addSubview:self.vertical2];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NumberpadCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell.button setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [cell.button addTarget:self action:@selector(myClickEvent:event:) forControlEvents:UIControlEventTouchUpInside];
    //add scoring for further confirmation?
    cell.button.titleLabel.font = [UIFont systemFontOfSize:35.0];
    [cell.button setTitle:[NSString stringWithFormat:@"%ld",(long)indexPath.row] forState:UIControlStateNormal];
    [cell.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //set up number pad for familiarity
    if([[cell.button currentTitle] isEqualToString:@"0"]){
        [cell.button setTitle:@"1" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"1"]){
        [cell.button setTitle:@"2" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"2"]){
        [cell.button setTitle:@"3" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"3"]){
        [cell.button setTitle:@"4" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"4"]){
        [cell.button setTitle:@"5" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"5"]){
        [cell.button setTitle:@"6" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"6"]){
        [cell.button setTitle:@"7" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"7"]){
        [cell.button setTitle:@"8" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"8"]){
        [cell.button setTitle:@"9" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"9"]){
        cell.button.layer.borderColor = [UIColor clearColor].CGColor;
        [cell.button setTitle:@"" forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"10"]){
        [cell.button setTitle:@"0" forState:UIControlStateNormal];
    }
    //pause button?
    else if([[cell.button currentTitle] isEqualToString:@"11"]){
        cell.button.layer.borderColor = [UIColor clearColor].CGColor;
        [cell.button setTitle:@"" forState:UIControlStateNormal];
    }
    
    return cell;
}
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 90.0f, 90.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (IBAction)myClickEvent:(id)sender event:(id)event {
    //ignore button presses without numbers
    if(![[sender currentTitle] isEqualToString:@""]) {
        [self.numbersTappedArray addObject:[sender currentTitle]];
    }
    
    //DO ERROR CHECKS
    
    if (self.randomNumbersArray.count - 1 < self.numbersTappedArray.count - 1){
        //ERROR-- IOB EXCEPTION
        return;
    }
    //if it is the last object in the array being compared and it is right, go to next level**
    if(self.randomNumbersArray.count - 1 == self.numbersTappedArray.count - 1 && [[sender currentTitle] isEqualToString:[self.randomNumbersArray objectAtIndex:self.numbersTappedArray.count - 1]])
    {
        currentScore = [NSNumber numberWithInt:[currentScore intValue] + timerView.percent];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score:\n%@", currentScore];
        if([currentScore intValue] > [highestScore intValue]){
            highestScore = [NSNumber numberWithInt:[currentScore intValue]];
            self.highestScoreLabel.text = [NSString stringWithFormat:@"Best:\n%@", highestScore];
        }
        [sender setBackgroundImage:[self imageWithColor:[UIColor greenColor]] forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self performSelector:@selector(changeBackgroundButtonColor:) withObject:sender afterDelay:0.25];
        [self performSelector:@selector(setUpNextLevel) withObject:nil afterDelay:0.25];
    }
    
    //if the right number is chosen, highlight it green temporarily and prepare for next touch event
    else if([[sender currentTitle] isEqualToString:[self.randomNumbersArray objectAtIndex:self.numbersTappedArray.count - 1]]){
        [sender setBackgroundImage:[self imageWithColor:[UIColor greenColor]]
                      forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self performSelector:@selector(changeBackgroundButtonColor:) withObject:sender afterDelay:0.25];
    }
    else if([[sender currentTitle] isEqualToString:@""]){
        //do nothing, empty buttons
    }
    //wrong number selected
    else {
        [sender setBackgroundImage:[self imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self performSelector:@selector(changeBackgroundButtonColor:) withObject:sender afterDelay:0.30];
        if( --livesRemaining <= 0){
            [defaults setObject:highestScore forKey:@"highestScore"];
            if([self.levelNumberLabel.text intValue] - 1 > [highestLevel intValue]){
                highestLevel = [NSNumber numberWithInt:[self.levelNumberLabel.text intValue] - 1];
                [defaults setObject:highestLevel forKey:@"highestLevel"];
            }
            [self performSelector:@selector(clearScreenGameOver) withObject:sender afterDelay:0.25];
        } else {
            self.livesLabel.text = [NSString stringWithFormat:@"X %d", livesRemaining];
            [highScoreTimer invalidate];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You lost a life!"
                                                            message:@"The wrong number was selected."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex: (NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        [self performSelector:@selector(retryLevel) withObject:nil afterDelay:0.25];
    }
}

-(void) clearScreenGameOver {
    //clear the screen
    [_collectionView removeFromSuperview];
    [self.levelNumberLabel removeFromSuperview];
    [self.levelLabel removeFromSuperview];
    [self.livesLabel removeFromSuperview];
    [self.imageHolder removeFromSuperview];
    [self.timerView removeFromSuperview];
    [self.highestScoreLabel removeFromSuperview];
    [self.scoreLabel removeFromSuperview];
    
    //add "Game over"
    self.tapNumbersLabel.text = @"Game Over!\rYou chose the wrong number";
    [secondMainMenuButton setHidden:NO];
    secondMainMenuButton.enabled = YES;
    livesRemaining = 3;
    [highScoreTimer invalidate];
    highScoreTimer = nil;
    [countDownTimer invalidate];
    countDownTimer = nil;
    i = 1;
}
-(void) setUpNextLevel {
    [_collectionView removeFromSuperview];
    [self.levelNumberLabel removeFromSuperview];
    [self.levelLabel removeFromSuperview];
    [self.livesLabel removeFromSuperview];
    [self.imageHolder removeFromSuperview];
    [self.tapNumbersLabel removeFromSuperview];
    [self.timerView removeFromSuperview];
    [self.highestScoreLabel removeFromSuperview];
    [self.scoreLabel removeFromSuperview];
    
    [self.view addSubview:self.getReadyLabel];
    [self.view addSubview:self.countdownLabel];
    
    //set text back to get ready from "Remember the numbers"
    self.getReadyLabel.text = @"Get Ready";
    //set the countdown back to 3 and set text color from red to black
    self.countdownLabel.text = @"3";
    self.countdownLabel.textColor = [UIColor blackColor];
    
    timerView.initialPercent += 10;
    timerView.percent = timerView.initialPercent;
    i++;
    [highScoreTimer invalidate];
    
    pauseCountdownButton.hidden = NO;
    pauseCountdownButton.enabled = YES;
    
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
}

-(void) retryLevel {
    [_collectionView removeFromSuperview];
    [self.levelNumberLabel removeFromSuperview];
    [self.levelLabel removeFromSuperview];
    [self.livesLabel removeFromSuperview];
    [self.imageHolder removeFromSuperview];
    [self.tapNumbersLabel removeFromSuperview];
    [self.timerView removeFromSuperview];
    [self.highestScoreLabel removeFromSuperview];
    [self.scoreLabel removeFromSuperview];
    
    [highScoreTimer invalidate];
    
    [self.view addSubview:self.getReadyLabel];
    [self.view addSubview:self.countdownLabel];
    //set text back to get ready from "Remember the numbers"
    self.getReadyLabel.text = @"Get Ready";
    //set the countdown back to 3 and set text color from red to black
    self.countdownLabel.text = @"3";
    self.countdownLabel.textColor = [UIColor blackColor];
    timerView.percent = timerView.initialPercent;
    
    pauseCountdownButton.hidden = NO;
    pauseCountdownButton.enabled = YES;
    
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
}

- (IBAction)mainMenuButtonSelected {
    //set highScore if it is higher than previous score (it is - 1 because current level failed)
    MainViewController *viewController = [[MainViewController alloc] init];
    viewController.highestLevel = highestLevel;
    if([self.levelNumberLabel.text intValue] - 1 > [highestLevel intValue]){
        highestLevel = [NSNumber numberWithInt:[self.levelNumberLabel.text intValue] - 1];
    }
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void) changeBackgroundButtonColor:(id)sender {
    [sender setBackgroundImage:[self imageWithColor:[UIColor clearColor]]
                      forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}
//center the cells in UICollectionView
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    NSInteger numberOfCells = self.view.frame.size.width / cellWidth;
    NSInteger edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1);
    
    return UIEdgeInsetsMake(0, edgeInsets, 0, edgeInsets);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) secondMainMenuButtonSelected {
    
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
