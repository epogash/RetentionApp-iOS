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
        self.button.layer.cornerRadius = self.contentView.bounds.size.width/2;
        self.button.layer.borderWidth = 2;
        self.button.layer.borderColor = [UIColor blackColor].CGColor;
        self.button.layer.masksToBounds = YES;
        [self.contentView addSubview:self.button];
        
    }
    return self;
}


//- (void)drawRect:(CGRect)rect
//{
//    self.layer.cornerRadius = self.contentView.bounds.size.width/2;
//    self.layer.borderWidth = 2;
//    self.layer.borderColor = [UIColor whiteColor].CGColor;
//}


@end
