//
//  BookmarkViewController.m
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BookmarkViewController.h"
//#import "EntryViewController.h"
#import <JSON/JSON.h>

@implementation BookmarkViewController
@synthesize feed;
@synthesize bookmarks;
//@synthesize evc;


- (void) displayBookmarks {
	NSMutableString *text = [[NSMutableString alloc] init];
	
	
	if(feed.count > 0) {
		for (int ndx = 0; ndx < feed.count; ndx++) {
			NSDictionary *stream = (NSDictionary *)[feed objectAtIndex:ndx];
			NSLog(@"This is the title of a bookmark: %@", [stream valueForKey:@"u"]); 
			[text appendString:@"Title: "];
			[text appendString:[stream valueForKey:@"d"]];
			[text appendString:@"\n"];
			
			[text appendString:@"Url: "];
			[text appendString:[stream valueForKey:@"u"]];
			[text appendString:@"\n"];
			
			NSArray *tags = [stream valueForKey:@"t"];			
		//	[tags initWithArray:[stream objectForKey:@"t"]];
			[text appendString:@"Tags: "];
			for(int ndx2 = 0; ndx2 < tags.count; ndx2++) {
				[text appendString:[tags objectAtIndex:ndx2]];
				[text appendString:@" "];
			}
			
			[text appendString:@"\n"];
			[text appendString:@"Date Posted: "];
			[text appendString:[stream valueForKey:@"dt"]];
			[text appendString:@"\n\n "];	
		//	[text appendString:[stream valueForKey:@"n"]];
		//	[text appendString:@"\n"]; 
		//	[text appendString:@"Posted by user: "];
		//	 [text appendString:[stream valueForKey:@"a"]]; 
		}	
		bookmarks.text = text;
		NSLog(@"Inside of displayBookmarks, the bookmarks textview contains %@", bookmarks.text);
	} 
	
	
}

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
	[bookmarks release];
	[feed release];
    [super dealloc];
}


@end
