//
//  HomeViewController.h
//  DeliciousReader
//
//  Created by Rashad Tatum on 5/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryViewController.h"
//#import "BookmarkViewController.h"
//#import "DeliciousReaderController.h"

@interface HomeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
	IBOutlet UIPickerView *picker;
	NSArray *pickerArray;
	EntryViewController *evc;
//	BookmarkViewController *bvc;
	DeliciousReaderController *drc;
	NSString *type;
}

@property (nonatomic, retain) UIPickerView *picker;
@property (nonatomic, retain) NSArray *pickerArray;
@property (nonatomic, assign) EntryViewController *evc;
//@property (nonatomic, retain) BookmarkViewController *bvc;
@property (nonatomic, assign) DeliciousReaderController *drc; 
@property (nonatomic, retain) NSString *type;

//methods for UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)picker;
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)col;
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

-(IBAction)buttonPressed:(id)sender;
@end
