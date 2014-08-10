//
//  PurchaseViewController.m
//  Retention3
//
//  Created by Eric Pogash on 8/9/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "PurchaseViewController.h"

@interface PurchaseViewController ()

@end

@implementation PurchaseViewController

- (void)viewDidLoad
{
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    self.productDescription.userInteractionEnabled = NO;
    self.productDescription.layer.cornerRadius = 10;
    self.productDescription.layer.borderWidth = 2;
    self.productDescription.layer.borderColor = [UIColor orangeColor].CGColor;
    
    [super viewDidLoad];
    self.productID = @"com.retention.retention.hardcore";
    [self getProductInfo];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(void)getProductInfo
{
    
    if ([SKPaymentQueue canMakePayments])
    {
        SKProductsRequest *request = [[SKProductsRequest alloc]
                                      initWithProductIdentifiers:
                                      [NSSet setWithObject:self.productID]];
        request.delegate = self;
        
        [request start];
    }
    else
        _productDescription.text =
        @"Please enable In App Purchase in Settings";
}

#pragma mark -
#pragma mark SKProductsRequestDelegate

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    
    NSArray *products = response.products;
    NSLog(@"products count: %lu", (unsigned long)products.count);
    if (products.count != 0)
    {
        NSLog(@"product[0] %@", products[0]);
        _product = products[0];
        _productTitle.text = _product.localizedTitle;
        _productDescription.text = _product.localizedDescription;
    } else {
        _productTitle.text = @"Product not found";
    }
    
    products = response.invalidProductIdentifiers;
    
    for (SKProduct *product in products)
    {
        NSLog(@"Product not found: %@", product);
    }
}

- (IBAction)buyProduct:(id)sender {
    SKPayment *payment = [SKPayment paymentWithProduct:_product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

#pragma mark -
#pragma mark SKPaymentTransactionObserver

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                [self unlockFeature];
                [[SKPaymentQueue defaultQueue]
                 finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateFailed:
                NSLog(@"Transaction Failed");
                [[SKPaymentQueue defaultQueue]
                 finishTransaction:transaction];
                break;
                
            default:
                break;
        }
    }
}

-(void)unlockFeature
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"hardcoreModeUnlocked"];
    [defaults synchronize];
}

- (IBAction)restoreCompletedTransactions {
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

@end
