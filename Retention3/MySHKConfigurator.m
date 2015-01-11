//
//  MySHKConfigurator.m
//  Retention3
//
//  Created by Eric Pogash on 7/31/14.
//  Copyright (c) 2014 Eric Pogash. All rights reserved.
//

#import "MySHKConfigurator.h"

@implementation MySHKConfigurator

- (NSString*)sharersPlistName {
	return @"MySHKSharers.plist";
}

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

// Plurk - http://www.plurk.com/API
- (NSString *)plurkAppKey {
    return @"Ws03w7cKcYMm";
}

- (NSString *)plurkAppSecret {
    return @"UAbn7sTtDkozBBOdj9CuvnCIy9udBxN6";
}

- (NSString *)plurkCallbackURL {
    return @"http://www.callback.com";
}

// Tumblr - http://www.tumblr.com/docs/en/api/v2
- (NSString*)tumblrConsumerKey {
	return @"20fu4quqoEhiwm9O8WbbB93tPQqCQCHSAZVcMOkUC5gvuNCqKx";
}

- (NSString*)tumblrSecret {
	return @"RTx9EQYebLDK1RP9z9xWZToiVzo97Ppc0XPw5Ww39GOsgDUPje";
}

//you can put whatever here. It must be the same you entered in tumblr app registration, eg tumblr.sharekit.com
- (NSString*)tumblrCallbackUrl {
	return @"www.phundless.com";
}

// Vkontakte
// SHKVkontakteAppID is the Application ID provided by Vkontakte
- (NSString*)vkontakteAppId {
	return @"4500298";
}

- (NSArray*)defaultFavoriteImageSharers {
    return [NSArray arrayWithObjects:@"SHKFacebook", @"SHKiOSFacebook", @"SHKTwitter", @"SHKiOSTwitter", @"SHKTumblr", nil];
}

@end
