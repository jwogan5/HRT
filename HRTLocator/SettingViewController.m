//
//  SettingViewController.m
//  HRTLocator
//
//  Created by Jason Wogan on 10/3/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "SettingViewController.h"
#import "MapViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
//@synthesize locSettingsTable;


- (IBAction) done {
	NSLog(@"clicked done button ...");
    
    // Save the user settings for now
    int constantLocation = 0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:constantLocation forKey:@"constantLocation"];
    [defaults synchronize];
    
    // Need to call calling window
    [_delegate didSomethingHappen:@"closedsettings"];
    
    // Close the Modal Settings Window
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"called settings view ...");
    
    /*
    locSettingsTable.layer.cornerRadius = 5;
    locSettingsTable.layer.shadowColor = [[UIColor blackColor] CGColor];
    locSettingsTable.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    locSettingsTable.layer.shadowOpacity = .90f;
    locSettingsTable.layer.shadowRadius = 3.0f;
     */
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
