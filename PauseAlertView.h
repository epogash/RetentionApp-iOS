//
//  PauseAlertView.h
//  Retention3
//
//  Created by Eric Pogash on 7/26/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PauseAlertView : UIView {
     CGRect originalFrame;
     BOOL isShown;
}

@property (nonatomic) BOOL isShown;

- (void)show;
- (void)hide;


@end
