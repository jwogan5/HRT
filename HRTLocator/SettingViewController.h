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

//@property (nonatomic, retain) IBOutlet UITableView *locSettingsTable;
@property (nonatomic, weak) id<ModalViewDelegate> delegate;

@end
