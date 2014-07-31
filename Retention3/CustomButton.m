//
//  CustomButton.m
//  Retention3
//
//  Created by Eric Pogash on 7/8/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 10;
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor blackColor].CGColor;
}


@end
