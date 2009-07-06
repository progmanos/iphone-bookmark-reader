//
//  BookmarkViewController.h
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSON/JSON.h>
//#import "EntryViewController.h"

@interface BookmarkViewController : UIViewController {
	NSMutableArray *feed;
	UITextView *bookmarks;
//	EntryViewController *evc;
}

@property (nonatomic, retain) NSMutableArray *feed;
@property (nonatomic, retain) IBOutlet UITextView *bookmarks;
//@property (nonatomic, assign) EntryViewController *evc;
-(void)displayBookmarks;
/* - (NSString *) stringWithUrl:(NSURL *)url;
- (NSArray *) downloadDeliciousFeed:(NSString *) username :(NSString *) bookmarktag: (NSString *) private_key; 
- (id) objectWithUrl:(NSURL *)url; */

@end
