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
#import "SettingViewController.h"
#import "mapCollections.h"
#import "Bus.h"

@protocol ModalViewDelegate
- (void)didSomethingHappen:(NSString *)message;
@end


@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,ModalViewDelegate>{
    MKMapView *mapView;
    UIView *bushigh;
    UIButton *favorite;
    UIImageView *favImage;
    UIImageView *backImage;
    UIButton *viewRoute;
    UIButton *closeOverlay;
    UILabel *busTitle;
    UILabel *busNumber;
    UILabel *routeTitle;
    UILabel *routeNumber;
}

@property NSMutableArray *arBusFavs;
@property NSInteger constantLocation;
@property NSInteger initialZoom;
@property mapCollections *mc;
@property BOOL mapLoad;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIView *bushigh;
@property (nonatomic, retain) IBOutlet UIButton *favorite;
@property (nonatomic, retain) IBOutlet UIButton *viewRoute;
@property (nonatomic, retain) IBOutlet UIButton *closeOverlay;
@property (nonatomic, retain) IBOutlet UIImageView *favImage;
@property (nonatomic, retain) IBOutlet UILabel *busTitle;
@property (nonatomic, retain) IBOutlet UILabel *busNumber;
@property (nonatomic, retain) IBOutlet UILabel *routeTitle;
@property (nonatomic, retain) IBOutlet UILabel *routeNumber;
@property (nonatomic, weak) id<ModalViewDelegate> delegate;

-(IBAction)updatelocation;
-(IBAction)getCurrentMapCenter;
-(IBAction)closeOverlayView;
-(void)plotMapCollections;


@end
