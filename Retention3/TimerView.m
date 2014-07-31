//
//  TimerView.m
//  Retention3
//
//  Created by Eric Pogash on 7/18/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "TimerView.h"

@implementation TimerView

@synthesize startAngle;
@synthesize endAngle;
@synthesize percent;
@synthesize initialPercent;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        // Determine our start and stop angles for the arc (in radians)
        startAngle = M_PI * 1.5;
        endAngle = startAngle + (M_PI * 2);
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Display our percentage as a string
    NSString* textContent = [NSString stringWithFormat:@"%ld", (long)self.percent];
    if(!initialPercent) {
        initialPercent = percent;
    }
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    UIBezierPath* circleView = [UIBezierPath bezierPath];
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:20
                      startAngle:startAngle
                        endAngle:(startAngle - endAngle) * (percent / (double)initialPercent) + endAngle
                       clockwise:NO];
    [circleView addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:20
                      startAngle:startAngle
                        endAngle:(startAngle - endAngle) * (percent / (double)initialPercent) + startAngle
                       clockwise:YES];
    // Set the display for the path, and stroke it
    [[UIColor blackColor] setFill];
    circleView.lineWidth = 5;
    [[UIColor grayColor] setStroke];
    [circleView fill];
    [circleView stroke];
    
    bezierPath.lineWidth = 5;
    if(percent > 2.0*initialPercent/3.0) {
        [[UIColor greenColor] setStroke];
    } else if (percent > initialPercent/3.0){
        [[UIColor yellowColor] setStroke];
    } else {
        [[UIColor redColor] setStroke];
    }
    [bezierPath fill];
    [bezierPath stroke];
    
    // Text Drawing
    CGRect textRect = CGRectMake((rect.size.width / 2.0) - 20, (rect.size.height / 2.0) - 10.5, 40, 40);
   
    
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:17];
    
    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle,
                                  NSForegroundColorAttributeName: [UIColor whiteColor]};
    [textContent drawInRect: textRect withAttributes:attributes];
}

@end
