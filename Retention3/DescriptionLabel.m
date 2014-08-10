//
//  DecriptionLabel.m
//  Retention3
//
//  Created by Eric Pogash on 8/9/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "DescriptionLabel.h"

@implementation DescriptionLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {5, 5, 5, 5};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}


@end
