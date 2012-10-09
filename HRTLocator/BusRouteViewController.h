//
//  BusRouteViewController.h
//  HRTLocator
//
//  Created by Jason Wogan on 10/5/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol ModalViewDelegate;

@interface BusRouteViewController : UIViewController{

}

@property (nonatomic, weak) id<ModalViewDelegate> delegate;

-(IBAction)closeMe;

@end
