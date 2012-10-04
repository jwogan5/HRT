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


@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>{
    MKMapView *mapView;
}

@property NSInteger initialZoom;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
-(IBAction)updatelocation;
-(IBAction)getCurrentMapCenter;

@end
