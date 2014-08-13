//
//  PaymentViewController.h
//  Retention3
//
//  Created by Eric Pogash on 8/13/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "PayPal.h"              // imports the PayPal library header file
// PayPal.h includes the statement #import <UIKit/UIKit.h>

@interface PaymentViewController : UIViewController
<PayPalPaymentDelegate> {       // this class implements the PayPalPaymentDelegate protocol
}

-(void)payWithPayPal;           // called when the user clicks the "Pay with PayPal" button
@end
