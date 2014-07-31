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
@synthesize highScore;
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
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    //collectionView instantiation
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/5, [[UIScreen mainScreen] bounds].size.width, 4*[[UIScreen mainScreen] bounds].size.height/5) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView registerClass:[NumberpadCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    //getReadyLabel instantiation
    self.getReadyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/3, [[UIScreen mainScreen] bounds].size.width, 20)];
    self.getReadyLabel.text = @"Get Ready";
    self.getReadyLabel.textAlignment = NSTextAlignmentCenter;
    //tapNumbersLabel instantiation
    self.tapNumbersLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/8, [[UIScreen mainScreen] bounds].size.width, 80)];
    self.tapNumbersLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.tapNumbersLabel.numberOfLines = 0;
    self.tapNumbersLabel.textAlignment = NSTextAlignmentCenter;
    //countdownLabel instantiation
    self.countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/2 - 40, [[UIScreen mainScreen] bounds].size.width, 30)];
    self.countdownLabel.textAlignment = NSTextAlignmentCenter;
    self.countdownLabel.text = @"3";
    //add subviews
    [self.view addSubview:self.countdownLabel];
    [self.view addSubview:self.getReadyLabel];
    //numberOfDigitsLeftToDisplay instantiation
    self.numberOfDigitsLeftToDisplay = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/3, [[UIScreen mainScreen] bounds].size.width, 20)];
    [super viewDidLoad];
    //NSTimer to start countdown
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
}
- (void) countdown:(NSTimer *) timer
{
    if([self.countdownLabel.text  isEqualToString: @"1"]){
        [timer invalidate];
        [self.countdownLabel removeFromSuperview];
        self.countdownLabel.text = @"" ;
        self.levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, [[UIScreen mainScreen] bounds].size.width, 20)];
        self.levelLabel.textAlignment = NSTextAlignmentCenter;
        self.levelLabel.text = @"Level:";
        [self.view addSubview:self.levelLabel];
        
        self.levelNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 + 30, 50, 20, 20)];
        self.levelNumberLabel.text = [NSString stringWithFormat:@"%d", i];
        [self.view addSubview:self.levelNumberLabel];
        
        self.getReadyLabel.text = @"Remember the numbers";
        
        [self addFocus];
        
        [self performSelector:@selector(displayRandomNumbers) withObject:nil afterDelay:1];
        
    } else {
        self.countdownLabel.text = [NSString stringWithFormat:@"%d",[self.countdownLabel.text  intValue] - 1];
    }
}
- (void) displayRandomNumbers
{
    //used to set number of digits-based on level number
    self.numberOfDigitsLeftToDisplay.text = self.levelNumberLabel.text;
    
    self.countdownLabel.textColor = [UIColor redColor];
    //speed at which to display the numbers, 0.25 is approx 250 WPM
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(generateNumbers:) userInfo:nil repeats:YES];
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
        //first,display all numbers (0-9), then monitor touch events in order, starting with index 0 of randomNumbersArray.
        //(compare values touched with index of array).
        //use collection view?
        //need a way to have a variable increase by one to compare in order just do locally!
        
        [self.view addSubview:_collectionView];
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
- (void) addFocus
{
    //Draw 4 lines for to enable focus on the changing numbers.
    self.horizontal1 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.horizontal1.backgroundColor = [UIColor clearColor];
    self.horizontal1.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor]);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, [[UIScreen mainScreen] bounds].size.width/3, [[UIScreen mainScreen] bounds].size.height/2 - 50);
        CGContextAddLineToPoint(context, 2*[[UIScreen mainScreen] bounds].size.width/3, [[UIScreen mainScreen] bounds].size.height/2 - 50);
        CGContextDrawPath(context, kCGPathStroke);
    };
    [self.view addSubview:self.horizontal1];
    
    self.horizontal2 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.horizontal2.backgroundColor = [UIColor clearColor];
    self.horizontal2.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor]);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, [[UIScreen mainScreen] bounds].size.width/3, [[UIScreen mainScreen] bounds].size.height/2);
        CGContextAddLineToPoint(context, 2*[[UIScreen mainScreen] bounds].size.width/3, [[UIScreen mainScreen] bounds].size.height/2);
        CGContextDrawPath(context, kCGPathStroke);
    };
    [self.view addSubview:self.horizontal2];
    
    self.vertical1 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.vertical1.backgroundColor = [UIColor clearColor];
    self.vertical1.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor]);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - 50);
        CGContextAddLineToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - 40);
        CGContextDrawPath(context, kCGPathStroke);
    };
    [self.view addSubview:self.vertical1];
    
    self.vertical2 = [[FocusView alloc] initWithFrame:self.view.bounds];
    self.vertical2.backgroundColor = [UIColor clearColor];
    self.vertical2.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor]);
        CGContextSetLineWidth(context, 2.0);
        CGContextMoveToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2);
        CGContextAddLineToPoint(context, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - 10);
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
    
    [cell.button addTarget:self action:@selector(myClickEvent:event:) forControlEvents:UIControlEventTouchUpInside];
    //add scoring for further confirmation?
    
    [cell.button setTitle:[NSString stringWithFormat:@"%ld",(long)indexPath.row] forState:UIControlStateNormal];
    [cell.button setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    
    if([[cell.button currentTitle] isEqualToString:@"10"]){
         [cell.button setTitle:[NSString stringWithFormat:@"%d",9] forState:UIControlStateNormal];
    }
    else if([[cell.button currentTitle] isEqualToString:@"9"]){
         [cell.button setTitle:@"" forState:UIControlStateNormal];
    }
    //pause button?
    else if([[cell.button currentTitle] isEqualToString:@"11"]){
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
    [self.numbersTappedArray addObject:[sender currentTitle]];
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    
    CGPoint currentTouchPosition = [touch locationInView:_collectionView];
    
    NSIndexPath *indexPath = [_collectionView indexPathForItemAtPoint: currentTouchPosition];
    //DO ERROR CHECKS
    
    if (self.randomNumbersArray.count - 1 < self.numbersTappedArray.count - 1){
        //ERROR-- IOB EXCEPTION
        return;
    }
    //if it is the last object in the array being compared and it is right, go to next level**
    if(self.randomNumbersArray.count - 1 == self.numbersTappedArray.count - 1 && [[sender currentTitle] isEqualToString:[self.randomNumbersArray objectAtIndex:self.numbersTappedArray.count - 1]])
    {
        [_collectionView removeFromSuperview];
        [self.levelNumberLabel removeFromSuperview];
        [self.levelLabel removeFromSuperview];
        [self.tapNumbersLabel removeFromSuperview];
        
        [self.view addSubview:self.getReadyLabel];
        [self.view addSubview:self.countdownLabel];
        //set text back to get ready from "Remember the numbers"
        self.getReadyLabel.text = @"Get Ready";
        //set the countdown back to 3 and set text color from red to black
        self.countdownLabel.text = @"3";
        self.countdownLabel.textColor = [UIColor blackColor];
        i++;
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
    }
    
    //if the right number is chosen, highlight it green temporarily and prepare for next touch event
    else if([[sender currentTitle] isEqualToString:[self.randomNumbersArray objectAtIndex:self.numbersTappedArray.count - 1]]){
       [sender setBackgroundImage:[self imageWithColor:[UIColor greenColor]]
                      forState:UIControlStateNormal];
        [self performSelector:@selector(changeBackgroundButtonColor:) withObject:sender afterDelay:0.25];
    }
    //wrong number selected
    else {
        //clear the screen
        [_collectionView removeFromSuperview];
        [self.levelNumberLabel removeFromSuperview];
        [self.levelLabel removeFromSuperview];
        //add "Game over"
        self.tapNumbersLabel.text = @"Game Over!\rYou chose the wrong number";
        //add "Main Menu" button
        self.mainMenuButton = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/3, 2*[[UIScreen mainScreen] bounds].size.height/3, [[UIScreen mainScreen] bounds].size.width/3, 30)];
        [self.mainMenuButton setTitle:@"Main Menu" forState:UIControlStateNormal];
        [self.mainMenuButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:(UIControlStateNormal)];
        [self.mainMenuButton addTarget:self action:@selector(mainMenuButtonSelected) forControlEvents:UIControlEventTouchUpInside];
        i = 1;
        [self.view addSubview:self.mainMenuButton];
        
    }
}
- (IBAction)mainMenuButtonSelected {
    //set highScore if it is higher than previous score (it is - 1 because current level failed)
    MainViewController *viewController = [[MainViewController alloc] initWithNibName:NSStringFromClass([MainViewController class]) bundle:nil];
    viewController.highScore = highScore;
    if([self.levelNumberLabel.text intValue] - 1 > [highScore intValue]){
        highScore = [NSNumber numberWithInt:[self.levelNumberLabel.text intValue] - 1];
    }
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void) changeBackgroundButtonColor:(id)sender {
    [sender setBackgroundImage:[self imageWithColor:[UIColor clearColor]]
                      forState:UIControlStateNormal];
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
