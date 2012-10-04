//
//  MapViewController.m
//  HRTLocator
//
//  Created by Jason Wogan on 10/3/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@end

@implementation MapViewController
@synthesize locationManager=_locationManager;
@synthesize mapView;
@synthesize initialZoom;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)updatelocation{
    
    self.initialZoom = 0;
    if([CLLocationManager locationServicesEnabled]){
        [self.locationManager startUpdatingLocation];
    }

}

-(IBAction)getCurrentMapCenter{
    
    NSLog(@"trying to get the center coordinates ...");
    
    CLLocationCoordinate2D center = [mapView convertPoint:mapView.center toCoordinateFromView:mapView];
    double lat = center.latitude;
    double lon = center.longitude;
    
    NSLog(@"The center latitude:%f",lat);
    NSLog(@"The center longitiude:%f",lon);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set is this the initial zoom
    self.initialZoom = 0;
  
    // Get all user default settings for the app
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"constantLocation"] != nil)
    {
        //constantLocation = [defaults integerForKey:@"constantLocation"];
        // read in variables that I might need in this method
    }
    else
    {
        [defaults setInteger:0 forKey:@"constantLocation"];
        [defaults synchronize];
    }

    // Define the Map
    mapView.mapType = MKMapTypeStandard;
    mapView.showsUserLocation = YES;
    mapView.delegate = self;
    
    // Define the User Location
    if(self.locationManager==nil){
        _locationManager=[[CLLocationManager alloc] init];        
        _locationManager.delegate=self;
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        _locationManager.distanceFilter=500;
        self.locationManager=_locationManager;
    }
    
    // Start the Location Manager Pinging Service
    if([CLLocationManager locationServicesEnabled]){
        [self.locationManager startUpdatingLocation];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (self.initialZoom == 0)
    {   self.initialZoom = 1;
        NSDate* eventDate = newLocation.timestamp;
        NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
        if (abs(howRecent) < 15.0)
        {
            if(newLocation.horizontalAccuracy < 35.0){
                
                MKCoordinateRegion region;
                region.center = newLocation.coordinate;
                MKCoordinateSpan span;
                span.latitudeDelta=0.2; //  0.001 to 120
                span.longitudeDelta=0.2;
                region.span=span;
                [self.mapView setRegion:region animated:YES];
            }
        }
    }
    
    // Turn off location services if the user wants it that way
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int constantLocation = [defaults integerForKey:@"constantLocation"];
    if (constantLocation != 1)
        [manager stopUpdatingLocation];

    NSLog(@"The constant location services are set to:%i",constantLocation);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
