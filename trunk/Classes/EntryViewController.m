//
//  EntryViewController.m
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EntryViewController.h"
#import "BookmarkViewController.h"
#import <JSON/JSON.h>

@implementation EntryViewController
@synthesize type;
@synthesize feed;
@synthesize userField;
@synthesize tagField;
@synthesize privatekeyField;
@synthesize mainController;

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

} */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"The value of the feed string type is %@", type);
    [super viewDidLoad];
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

// downloads data from a url and returns a string
// Code from http://tr.im/jYGY
- (NSString *)stringWithUrl:(NSURL *)url
{
	//NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
	//	cachePolicy:NSURLRequestReturnCacheDataElseLoad
	//	timeoutInterval:30];
	NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url	cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
	
	
	[mutableRequest setValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
	
	
	NSLog(@"The NSURLRequest is: ", mutableRequest);
	// Fetch the JSON response
	NSData *urlData;
	NSURLResponse *response;
	NSError *error;
	
	
	//NSMutableRequest code based http://amromousa.com/2008/08/27/nsurlconnection-timeoutconnection-amdev-woes/
	// Make synchronous request
	urlData = [NSURLConnection sendSynchronousRequest:mutableRequest
									returningResponse:&response
												error:&error];
	NSLog(@"urlData for: %@", url);
	//NSLog(@"the response is: %@", [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
	NSLog(@"is currently: %@", [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding]);
	
	
 	// Construct a String around the Data from the response
	return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
}

//  from http://tr.im/jYGY
// creates a JSON object by converting the data at NSUrl url to a NSString
// and then parsing the NSString to a JSON object
- (id) objectWithUrl:(NSURL *)url
{
	SBJSON *jsonParser = [[SBJSON new] autorelease];
	NSString *jsonString = [self stringWithUrl:url];
	NSError *error;
	// Parse the JSON file into an Object
	id jsonobj = [jsonParser objectWithString:jsonString error:&error];
	//NSLog(@"Could not parse the file because of the following error: %@", error);
	
	//SBJsonParser.h uses Character pointers to determine the type of JSON Object.  
	// The code below tests to see if the NSString is converted properly.
	/* NSString *textjson = [self stringWithUrl:[NSURL URLWithString:@"http://feeds.delicious.com/v2/json/chris_draycott"]];
	 char *feedchar = [textjson UTF8String];
	 NSLog(@"The feed's leading character is: %@", *feedchar); */
	return jsonobj;
}



// based on code from http://tr.im/jYGY
// code modified to download feed based on the type the user selects
- (NSArray *) downloadDeliciousFeed:(NSString *) username :(NSString *) bookmarktag: (NSString *) private_key 
{
	NSString *url = @"";
	id response;
	if ([type  compare:@"hotlist"] == NSOrderedSame) {
		response = [self objectWithUrl:[NSURL URLWithString:@"http://feeds.delicious.com/v2/json"]];
	}
	else if ([type compare:@"recent"] == NSOrderedSame) {
		response = [self objectWithUrl:[NSURL URLWithString:@"http://feeds.delicious.com/v2/json/recent"]];
	}
	else if ([type compare:@"popular"] == NSOrderedSame) {
		response = [self objectWithUrl:[NSURL URLWithString:@"http://feeds.delicious.com/v2/json/popular"]];
	}
	else if ([type compare:@"popular_bytag"] == NSOrderedSame) {
		url = @"http://feeds.delicious.com/v2/json/popular/";
		url = [url stringByAppendingString:bookmarktag];
		response = [self objectWithUrl:[NSURL URLWithString:url]];
	}
	else if ([type compare:@"user"] == NSOrderedSame) {
		url = @"http://feeds.delicious.com/v2/json/";
		url = [url stringByAppendingString:username];
		response = [self objectWithUrl:[NSURL URLWithString:url]];
	}
	else if ([type compare:@"user_bytag"] == NSOrderedSame) {
		// current version only accepts one tag
		url = @"http://feeds.delicious.com/v2/json/";
		url = [url stringByAppendingString:username]; 
		url = [url stringByAppendingString:@"/"];
		url = [url stringByAppendingString:bookmarktag];
		response = [self objectWithUrl:[NSURL URLWithString:url]];
	}
	else if ([type compare:@"user_priv"] == NSOrderedSame) {
		url = [url stringByAppendingString:@"http://feeds.delicious.com/v2/json/"];
		url = [url stringByAppendingString:username];	
		url = [url stringByAppendingString:@"?private="];
		url = [url stringByAppendingString:private_key];
		response = [self objectWithUrl:[NSURL URLWithString:url]];
	}
	else if ([type compare:@"user_priv_bytag"] == NSOrderedSame) {
		url = [url stringByAppendingString:@"http://feeds.delicious.com/v2/json/"];
		url = [url stringByAppendingString:username];	
		url = [url stringByAppendingString:@"/"];
		url = [url stringByAppendingString:bookmarktag];
		url = [url stringByAppendingString:@"?private="];
		url = [url stringByAppendingString:private_key];
		//	NSLog(@"The contents of the feed file is: %@", (NSDictionary *)[self objectWithUrl:[NSURL URLWithString:url]]);
		response = [self objectWithUrl:[NSURL URLWithString:url]];
	}
	
	
	
	NSArray *array = (NSArray *)response;
	
	return array;
}

- (BOOL)textFieldShouldReturn:(UITextField*)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}

-(IBAction)entryButtonPressed:(id)sender {
	feed = [self downloadDeliciousFeed: userField.text :tagField.text :privatekeyField.text];
	[mainController setBookmarkView:nil];
}

- (void)dealloc {
	[type release];
	[feed release];
	[userField release];
	[tagField release];
	[privatekeyField release];
//	[bvc release];
    [super dealloc];
}


@end
