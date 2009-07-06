//
//  DeliciousReaderController.h
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSON/JSON.h>

@class EntryViewController;
@class BookmarkViewController;
@class HomeViewController;

@interface DeliciousReaderController : UIViewController {
	EntryViewController *entryViewController;
	BookmarkViewController *bookmarkViewController;
	HomeViewController *homeViewController;
	IBOutlet UILabel *label;
}

@property (nonatomic, retain) EntryViewController *entryViewController;
@property (nonatomic, retain) BookmarkViewController *bookmarkViewController;
@property (nonatomic, retain) HomeViewController *homeViewController;
@property (nonatomic, retain) UILabel *label;

-(IBAction)setBookmarkView:(id)sender;
-(IBAction)setEntryView:(id)sender;
-(IBAction)setHomeView:(id)sender;

@end
