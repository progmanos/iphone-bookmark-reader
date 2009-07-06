//
//  EntryViewController.h
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSON/JSON.h>
#import "DeliciousReaderController.h"

@interface EntryViewController : UIViewController {
	NSString *type;
	NSMutableArray *feed;
	DeliciousReaderController* mainController;
	UITextField *userField;
	UITextField *tagField; 
	UITextField *privatekeyField;  
}

@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSMutableArray *feed;
@property (nonatomic, assign) 	DeliciousReaderController* mainController;

@property (nonatomic, retain) IBOutlet UITextField *userField;
@property (nonatomic, retain) IBOutlet UITextField *tagField;
@property (nonatomic, retain) IBOutlet UITextField *privatekeyField;

- (NSString *) stringWithUrl:(NSURL *)url;
- (NSArray *) downloadDeliciousFeed:(NSString *) username :(NSString *) bookmarktag: (NSString *) private_key; 
- (id) objectWithUrl:(NSURL *)url;

-(IBAction)entryButtonPressed:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField*)aTextField;
@end
