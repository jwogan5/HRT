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
}

@property NSInteger initialZoom;
@property BOOL mapLoad;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIView *bushigh;
-(IBAction)updatelocation;
-(IBAction)getCurrentMapCenter;

@end
