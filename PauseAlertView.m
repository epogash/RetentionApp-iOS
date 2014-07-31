//
//  PauseAlertView.m
//  Retention3
//
//  Created by Eric Pogash on 7/26/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "PauseAlertView.h"

@implementation PauseAlertView

@synthesize isShown;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        originalFrame = frame;
        
        self.alpha = 0;
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
        label.text = @"Hellooooo!";
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        closeButton.frame = CGRectMake(10, frame.size.height - 45, frame.size.width - 20, 35);
        [closeButton setTitle:@"Close" forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeButton];
    }
    return self;
}

- (void)show
{
    NSLog(@"show");
    isShown = YES;
    self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    self.alpha = 0;
    [UIView beginAnimations:@"showAlert" context:nil];
    [UIView setAnimationDelegate:self];
    self.transform = CGAffineTransformMakeScale(1.1, 1.1);
    self.alpha = 1;
    [UIView commitAnimations];
}

- (void)hide
{
    NSLog(@"hide");
    isShown = NO;
    [UIView beginAnimations:@"hideAlert" context:nil];
    [UIView setAnimationDelegate:self];
    self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    self.alpha = 0;
    [UIView commitAnimations];
}

#pragma mark Animation delegate

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID isEqualToString:@"showAlert"]) {
        if (finished) {
            [UIView beginAnimations:nil context:nil];
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
            [UIView commitAnimations];
        }
    } else if ([animationID isEqualToString:@"hideAlert"]) {
        if (finished) {
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
            self.frame = originalFrame;
        }
    }
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
