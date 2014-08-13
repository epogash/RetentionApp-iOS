//
//  PurchaseViewController.h
//  Retention3
//
//  Created by Eric Pogash on 8/9/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
@class Reachability;
Reachability* internetReachable;
Reachability* hostReachable;
@interface PurchaseViewController : UIViewController
<SKPaymentTransactionObserver, SKProductsRequestDelegate>

@property (strong, nonatomic) SKProduct *product;
@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) IBOutlet UILabel *productTitle;
@property (strong, nonatomic) IBOutlet UITextView *productDescription;
@property (strong, nonatomic) IBOutlet UIButton *buyButton;

@property BOOL internetActive;
@property BOOL hostActive;
- (IBAction)buyProduct:(id)sender;
- (IBAction)restoreCompletedTransactions;
- (void) getProductInfo;
-(void) checkNetworkStatus:(NSNotification *)notice;
@end
