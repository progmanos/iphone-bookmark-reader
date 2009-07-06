//
//  DeliciousReaderController.m
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DeliciousReaderController.h"
#import "EntryViewController.h"
#import	"BookmarkViewController.h"
#import "HomeViewController.h"
#import <JSON/JSON.h>

@implementation DeliciousReaderController
@synthesize entryViewController;
@synthesize bookmarkViewController;
@synthesize homeViewController;
@synthesize label;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	HomeViewController *homeController = [[HomeViewController alloc]
										  initWithNibName:@"HomeView" bundle:nil];
	self.homeViewController = homeController;
	
	[self.view insertSubview:homeController.view atIndex:0];
	
	BookmarkViewController *bookmarkController = [[BookmarkViewController alloc] initWithNibName:@"BookmarkView" bundle:nil];
	self.bookmarkViewController = bookmarkController;
	[bookmarkController release];
	
	EntryViewController *entryController = [[EntryViewController alloc] initWithNibName:@"EntryView" bundle:nil];
	self.entryViewController = entryController;
	entryController.mainController=self;
	[entryController release];

	homeController.evc = entryController;
	homeController.drc = self;
	//bookmarkController.evc = entryController;
	[homeController release];
}

/*
-(IBAction)switchViews:(id)sender {
	
	if(self.entryViewController == nil) {
		EntryViewController *entryController =
		[[EntryViewController alloc]
		 initWithNibName:@"EntryView" bundle:nil];
		self.entryViewController = entryController;
		[entryController release];

	}
	
	if(self.bookmarkViewController == nil) {
		BookmarkViewController *bookmarkController =
		[[BookmarkViewController alloc]
		 initWithNibName:@"BookmarkView" bundle:nil];
		self.bookmarkViewController = bookmarkController;
		[bookmarkController release];
	} 
	
	if(self.homeViewController.view.superview == nil) {
		[entryViewController.view removeFromSuperview];
		[self.view insertSubview:entryViewController.view atIndex:0];
	}
	else {
		
		[homeViewController.view removeFromSuperview];
		[self.view insertSubview:bookmarkViewController.view atIndex:0];
	}
	
} */ 

-(IBAction)setHomeView:(id)sender {
	[[self.view.subviews objectAtIndex:0] removeFromSuperview];
	[self.view insertSubview:homeViewController.view atIndex:0];
}

-(IBAction)setEntryView:(id)sender {
	[[self.view.subviews objectAtIndex:0] removeFromSuperview];
	entryViewController.type  = homeViewController.type;
	NSLog(@"The Home view controller's type is %@", homeViewController.type);
	
	
	
	NSLog(@"EntryViewController's type when switching is %@", entryViewController.type);
	[self.view insertSubview:entryViewController.view atIndex:0];
	
	if([entryViewController.type rangeOfString:@"priv"].location == NSNotFound) {
		entryViewController.privatekeyField.enabled = NO;
	}
	else {
		entryViewController.privatekeyField.enabled = YES;
	}
	
	if([entryViewController.type rangeOfString:@"tag"].location == NSNotFound) {
		entryViewController.tagField.enabled = NO;
	}
	else {
		entryViewController.tagField.enabled = YES;
	}
	
	if([entryViewController.type rangeOfString:@"user"].location == NSNotFound) {
		entryViewController.userField.enabled = NO;
	}
	else {
		entryViewController.userField.enabled = YES;
	}
	
}
-(IBAction)setBookmarkView:(id)sender {
	int arraycount = [entryViewController.feed count];
	NSLog(@"The entry view length is %d", arraycount);
	bookmarkViewController.feed = entryViewController.feed;
	[[self.view.subviews objectAtIndex:0] removeFromSuperview];
	
	[self.view insertSubview:bookmarkViewController.view atIndex:0];
	[bookmarkViewController displayBookmarks];
	NSLog(@"The bookmark's textview contains %@", bookmarkViewController.bookmarks.text);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [entryViewController release];
	[bookmarkViewController release];
	[homeViewController release];
	[super dealloc];
	
}


@end
