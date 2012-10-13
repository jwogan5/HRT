//
//  SettingViewController.h
//  HRTLocator
//
//  Created by Jason Wogan on 10/3/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol ModalViewDelegate;

@interface SettingViewController : UIViewController{
    //UITableView *locSettingsTable;
}

// Actions for the View
-(IBAction)alwaysON;
-(IBAction)showBusPins;
-(IBAction)showMuseumPins;

// Outlets for buttons and switches
@property (nonatomic, retain) IBOutlet UISwitch *alwaysonswitch;
@property (nonatomic, retain) IBOutlet UISwitch *showbusswitch;
@property (nonatomic, retain) IBOutlet UISwitch *showmuseumswitch;
@property (nonatomic, retain) IBOutlet UILabel *totalBusFavs;

//@property (nonatomic, retain) IBOutlet UITableView *locSettingsTable;
@property (nonatomic, weak) id<ModalViewDelegate> delegate;


@end
