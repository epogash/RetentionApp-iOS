//
//  PaymentViewController.m
//  Retention3
//
//  Created by Eric Pogash on 8/13/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "PaymentViewController.h"
#import "PayPalPayment.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIButton *button = [[PayPal getPayPalInst]
                        getPayButtonWithTarget:self
                        andAction:@selector(payWithPayPal)
                        andButtonType:BUTTON_278x43
                        andButtonText:BUTTON_TEXT_PAY];
    
    [self.view addSubview:button];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)payWithPayPal {
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    [[PayPal getPayPalInst] advancedCheckoutWithPayment:payment];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
