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
@synthesize bushigh;
@synthesize mapLoad;
@synthesize favorite;
@synthesize favImage;
@synthesize closeOverlay;
@synthesize viewRoute;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"here");
    }
    return self;
}

-(IBAction)updatelocation{
    
    self.initialZoom = 0;
    if([CLLocationManager locationServicesEnabled]){
        [self.locationManager startUpdatingLocation];
    }
    
    // Animate in the bus highlighted view
    if (bushigh.layer.hidden == true)
    {
        //bushigh.alpha = 0.0;
        bushigh.layer.hidden = false;
        [UIView animateWithDuration:.8
                              delay:0.0
                            options: UIViewAnimationCurveEaseInOut
                         animations:^{
                             if (self.mapLoad == true)
                             {
                                bushigh.center = CGPointMake(bushigh.center.x, bushigh.center.y - 60);
                                viewRoute.center = CGPointMake(viewRoute.center.x, viewRoute.center.y - 60);
                             }
                             else
                             {
                                 self.mapLoad = true;
                                 viewRoute.hidden = false;
                             }                                 
                         }
                         completion:nil];
    }

    
}

-(IBAction)getCurrentMapCenter{
    
    NSLog(@"trying to get the center coordinates ...");
    
    CLLocationCoordinate2D center = [mapView convertPoint:mapView.center toCoordinateFromView:mapView];
    double lat = center.latitude;
    double lon = center.longitude;
    
    NSLog(@"The center latitude:%f",lat);
    NSLog(@"The center longitiude:%f",lon);
    
    // Set the bus favorite star
    UIImage *favimage = [UIImage imageNamed:@"star.png"];
    [favImage setImage:favimage];
}


-(IBAction)closeOverlayView{
    
    if (bushigh.layer.hidden == false)
    {
        [UIView animateWithDuration:.8 delay:0.0 options: UIViewAnimationCurveEaseInOut
            animations:^{
                bushigh.center = CGPointMake(bushigh.center.x, bushigh.center.y + 60);
                viewRoute.center = CGPointMake(viewRoute.center.x, viewRoute.center.y + 60);
            }
            completion:^(BOOL finished){
                bushigh.layer.hidden = true;
            }
         ];
    }
   
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hide the bus highlight window
    bushigh.layer.hidden = true;
    viewRoute.hidden = true;
    self.mapLoad = false;
    
    // Create Bus Array
    Bus *bus = [[Bus alloc]init];
    [bus setNumber:2035];
    [bus setLocation:@"My Location is Home"];
    NSLog(@"Bus number is %i",[bus getNumber]);
    NSLog(@"Bus lat is : %f",[bus getLat]);
    NSLog(@"Bus lon is : %f",[bus getLon]);
    
    
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
