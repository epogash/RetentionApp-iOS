//
//  focusView.m
//  NumbersGame
//
//  Created by Eric Pogash on 5/7/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "FocusView.h"

@implementation FocusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
 
    CGContextRef context = UIGraphicsGetCurrentContext();
 
    if(self.drawBlock)
        self.drawBlock(self,context);
}

@end
