//
//  MapViewController.h
//  HRTLocator
//
//  Created by Jason Wogan on 10/3/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import "Bus.h"


@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>{
    MKMapView *mapView;
    UIView *bushigh;
    UIButton *favorite;
    UIImageView *favImage;
    UIImageView *backImage;
    UIButton *viewRoute;
    UIButton *closeOverlay;
}

@property NSInteger initialZoom;
@property BOOL mapLoad;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIView *bushigh;
@property (nonatomic, retain) IBOutlet UIButton *favorite;
@property (nonatomic, retain) IBOutlet UIButton *viewRoute;
@property (nonatomic, retain) IBOutlet UIButton *closeOverlay;
@property (nonatomic, retain) IBOutlet UIImageView *favImage;
-(IBAction)updatelocation;
-(IBAction)getCurrentMapCenter;
-(IBAction)closeOverlayView;

@end
