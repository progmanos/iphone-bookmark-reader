//
//  HomeViewController.m
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "EntryViewController.h"
//#import	"BookmarkViewController.h"
#import "DeliciousReaderController.h"

@implementation HomeViewController

@synthesize picker;
@synthesize pickerArray;
@synthesize evc;
//@synthesize bvc;
@synthesize drc; 
@synthesize type;

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
	NSArray *array = [[NSArray arrayWithObjects:@"Hotlist", @"Recent", @"Popular", @"Popular By Tag", @"User", @"User By Tag", @"User's Private Feed", @"User's Private By Tag", nil] retain];
	picker.showsSelectionIndicator = YES;
	self.pickerArray = array;

}


- (IBAction)buttonPressed:(id)sender
{
	if(([type rangeOfString:@"user"].location != NSNotFound) || ([type rangeOfString:@"tag"].location != NSNotFound)) { 
		// I hope to eventually make this code successfully disable the UITextFields as listed below
	/*	if([type rangeOfString:@"priv"].location == NSNotFound) {
			evc.privatekeyField.enabled = NO;
		}
		if([type rangeOfString:@"tag"].location == NSNotFound) {
			evc.tagField.enabled = NO;
		}
		if([type rangeOfString:@"user"].location == NSNotFound) {
			evc.userField.enabled = NO;
		} */
		[drc setEntryView:nil];
	}
	else {
		[evc entryButtonPressed:nil];
	}
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
	[picker release];
	[pickerArray release];
	[type release];
    [super dealloc];
}


#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)picker
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	type = @"hotlist";
	NSLog(@"The Home View's default type variable is %@", type);
	return [pickerArray count];
}

#pragma mark Picker Delegate Methods

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	NSString *option = [pickerArray objectAtIndex:row];
	
	if( [option compare:@"Hotlist"] == NSOrderedSame ) {
		type = @"hotlist";		 
	}
	else if( [option compare:@"Recent"] == NSOrderedSame ) {
		type = @"recent";
	}
	else if( [option compare:@"Popular"] == NSOrderedSame ) {
		type = @"popular";
	}
	else if( [option compare:@"Popular By Tag"] == NSOrderedSame ) {
		type = @"popular_bytag";
	}
	else if( [option compare:@"User"] == NSOrderedSame ) {
		type = @"user";
	}
	else if( [option compare:@"User By Tag"] == NSOrderedSame) {
		type = @"user_bytag";
	}
	else if( [option compare:@"User's Private Feed"] == NSOrderedSame) {
		type = @"user_priv";
	}
	else if( [option compare:@"User's Private By Tag"] == NSOrderedSame) {
		type = @"user_priv_bytag";
	}
	NSLog(@"The Home View's type variable is %@", type);
	NSLog(@"The option's value is %@", option);

	
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [pickerArray objectAtIndex:row];
}


@end
