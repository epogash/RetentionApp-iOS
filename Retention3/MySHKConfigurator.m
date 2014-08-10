//
//  MySHKConfigurator.m
//  Retention3
//
//  Created by Eric Pogash on 7/31/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "MySHKConfigurator.h"

@implementation MySHKConfigurator

- (NSString*)facebookAppId {
	return @"480790838723685";
}

- (NSString*)twitterConsumerKey {
	return @"uQowdmL8h5eKpyz1xCtanW7QF";
}

- (NSString*)twitterSecret {
	return @"JgHuHVp6ddSdlxXcl5Apf0A3rK5ty4iCDvSzAM3rVtdnZoDris";
}
// You need to set this if using OAuth, see note above (xAuth users can skip it)
- (NSString*)twitterCallbackUrl {
	return @"http://www.callbackurl.com";
}

- (NSArray*)defaultFavoriteURLSharers {
    return [NSArray arrayWithObjects:@"SHKTwitter",@"SHKiOSTwitter", @"SHKFacebook", @"SHKiOSFacebook", @"SHKPocket", nil];
}

@end
