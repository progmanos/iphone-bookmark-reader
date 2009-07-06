//
//  DeliciousReaderAppDelegate.m
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "DeliciousReaderAppDelegate.h"
#import "DeliciousReaderController.h"

@implementation DeliciousReaderAppDelegate

@synthesize window;
@synthesize readerController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[window addSubview:readerController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[readerController release];
    [super dealloc];
}


@end
