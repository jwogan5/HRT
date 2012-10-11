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
@synthesize busNumber;
@synthesize busTitle;
@synthesize routeNumber;
@synthesize routeTitle;
@synthesize mc;
@synthesize arBusFavs;
@synthesize constantLocation;




- (void)didSomethingHappen:(NSString *)message {
    if ([message isEqualToString:(@"closedsettings")])
    {
       if (bushigh.layer.hidden == true)
       {
           [UIView animateWithDuration:0 delay:0.0 options: UIViewAnimationCurveEaseInOut
                            animations:^{
                                bushigh.center = CGPointMake(bushigh.center.x, bushigh.center.y + 60);
                                viewRoute.center = CGPointMake(viewRoute.center.x, viewRoute.center.y + 60);
                                closeOverlay.center = CGPointMake(closeOverlay.center.x, closeOverlay.center.y + 60);
                                favorite.center = CGPointMake(favorite.center.x, favorite.center.y + 60);
                                favImage.center = CGPointMake(favImage.center.x, favImage.center.y + 60);
                                busNumber.center = CGPointMake(busNumber.center.x, busNumber.center.y + 60);
                                busTitle.center = CGPointMake(busTitle.center.x, busTitle.center.y + 60);
                                routeTitle.center = CGPointMake(routeTitle.center.x, routeTitle.center.y + 60);
                                routeNumber.center = CGPointMake(routeNumber.center.x, routeNumber.center.y + 60);
                            }
                            completion:^(BOOL finished){
                                bushigh.layer.hidden = true;
                                closeOverlay.hidden = true;
                                self.mapLoad = false;
                                
                                viewRoute.hidden = true;
                                favImage.hidden = true;
                                favorite.hidden = true;
                                busTitle.hidden = true;
                                busNumber.hidden = true;
                                routeNumber.hidden = true;
                                routeTitle.hidden = true;
                            }
            ];

       }
    }
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
        closeOverlay.hidden = false;
        [UIView animateWithDuration:.8
                              delay:0.0
                            options: UIViewAnimationCurveEaseInOut
                         animations:^{
                             if (self.mapLoad == true)
                             {
                                bushigh.center = CGPointMake(bushigh.center.x, bushigh.center.y - 60);
                                viewRoute.center = CGPointMake(viewRoute.center.x, viewRoute.center.y - 60);
                                closeOverlay.center = CGPointMake(closeOverlay.center.x, closeOverlay.center.y - 60);
                                favorite.center = CGPointMake(favorite.center.x, favorite.center.y - 60);
                                favImage.center = CGPointMake(favImage.center.x, favImage.center.y - 60);
                                busNumber.center = CGPointMake(busNumber.center.x, busNumber.center.y - 60);
                                busTitle.center = CGPointMake(busTitle.center.x, busTitle.center.y - 60);
                                routeTitle.center = CGPointMake(routeTitle.center.x, routeTitle.center.y - 60);
                                routeNumber.center = CGPointMake(routeNumber.center.x, routeNumber.center.y - 60);
                             }
                             else
                             {
                                 self.mapLoad = true;
                                 viewRoute.hidden = false;
                                 favImage.hidden = false;
                                 favorite.hidden = false;
                                 busTitle.hidden = false;
                                 busNumber.hidden = false;
                                 routeNumber.hidden = false;
                                 routeTitle.hidden = false;
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
                closeOverlay.center = CGPointMake(closeOverlay.center.x, closeOverlay.center.y + 60);
                favorite.center = CGPointMake(favorite.center.x, favorite.center.y + 60);
                favImage.center = CGPointMake(favImage.center.x, favImage.center.y + 60);
                busNumber.center = CGPointMake(busNumber.center.x, busNumber.center.y + 60);
                busTitle.center = CGPointMake(busTitle.center.x, busTitle.center.y + 60);
                routeTitle.center = CGPointMake(routeTitle.center.x, routeTitle.center.y + 60);
                routeNumber.center = CGPointMake(routeNumber.center.x, routeNumber.center.y + 60);
            }
            completion:^(BOOL finished){
                bushigh.layer.hidden = true;
                closeOverlay.hidden = true;
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
    closeOverlay.hidden = true;
    favImage.hidden = true;
    favorite.hidden = true;
    busTitle.hidden = true;
    busNumber.hidden = true;
    routeNumber.hidden = true;
    routeTitle.hidden = true;
    self.mapLoad = false;
    self.initialZoom = 0;
    
    // Get all user default settings for the app
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"constantLocation"] != nil)
    {
        self.constantLocation = [defaults integerForKey:@"constantLocation"];
        self.arBusFavs = [defaults objectForKey:@"myFavoritesBus"];
    }
    else
    {
        // Initialize Vars
        self.arBusFavs = [[NSMutableArray alloc] init];
        self.constantLocation = 0;
        
        [defaults setInteger:self.constantLocation forKey:@"constantLocation"];
        [defaults setObject:self.arBusFavs forKey:@"myFavoritesBus"];
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
    
    
    // Create Transit Array Object
    mc = [[mapCollections alloc]init];
    [mc loadHRTBusData];
    NSMutableArray *busLocationData = [mc getBusData];
    Bus *currentBus = [busLocationData objectAtIndex:0];
    int cbusNum = [currentBus getNumber];
    
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
    if (self.constantLocation != 1)
        [manager stopUpdatingLocation];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"here");
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Tell AnotherViewController that you want to be the delegate
    [segue.destinationViewController setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
