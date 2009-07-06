//
//  DeliciousReaderAppDelegate.h
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DeliciousReaderController;

@interface DeliciousReaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	DeliciousReaderController *readerController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DeliciousReaderController *readerController;

@end

