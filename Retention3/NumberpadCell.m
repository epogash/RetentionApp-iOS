//
//  NumberpadCell.m
//  NumbersGame
//
//  Created by Eric Pogash on 5/11/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "NumberpadCell.h"

@implementation NumberpadCell
@synthesize button = _button;

- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height)];
        [self.contentView addSubview:self.button];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
