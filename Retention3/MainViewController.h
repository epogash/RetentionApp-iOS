//
//  ViewController.h
//  NumbersGame
//
//  Created by Eric Pogash on 4/27/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighScoreViewController.h"
#import "DifficultyViewController.h"

@interface MainViewController : UIViewController
@property (nonatomic, strong) NSNumber *highestLevel;
@property (nonatomic, strong) IBOutlet UILabel *label;
- (id)init;
-(IBAction) thankDeveloperButtonTapped;
@end



/* Ideas:
 -Add lives, lose one for each incorrect answer (red if incorrect)
 -Add scoring system based on speed and/or number of numbers correctly chosen in a given level before losing
 -Add different difficulties for different number display speeds (higher score)
 -Add a store to buy stuff with your points - more lives, point boost, etc. (can buy points with more money)
 -If above is made, implement a 'Hardcore Mode' where the point boosts aren't allowed
 
 Things to do:
 -Make it look better (obviously)
 
*/