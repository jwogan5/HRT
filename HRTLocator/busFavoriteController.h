//
//  busFavoriteController.h
//  HRTLocator
//
//  Created by Jason on 10/12/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface busFavoriteController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *busFavs;
    IBOutlet UITableView *busfavtable;
}

@property (nonatomic, retain) IBOutlet UITableView *busfavtable;

- (IBAction) done;


@end
