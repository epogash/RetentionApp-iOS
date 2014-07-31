//
//  focusView.h
//  NumbersGame
//
//  Created by Eric Pogash on 5/7/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FocusView_DrawBlock)(UIView* v,CGContextRef context);

@interface FocusView : UIView
@property (nonatomic,copy) FocusView_DrawBlock drawBlock;
@end
