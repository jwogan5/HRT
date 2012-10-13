//
//  SettingViewController.m
//  HRTLocator
//
//  Created by Jason Wogan on 10/3/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "SettingViewController.h"
#import "MapViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

// Synthesize vars
@synthesize alwaysonswitch;
@synthesize totalBusFavs;
@synthesize showbusswitch;
@synthesize showmuseumswitch;



/*
    Method alwaysON
    - This method turns locations services to off or always on
*/
-(IBAction)alwaysON{
    
    // Handles the click of the switch
    int ialwayson;
    if (self.alwaysonswitch.on)
        ialwayson = 1;
    else
        ialwayson = 0;
    
    // Saves the new value to the property
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:ialwayson forKey:@"constantLocation"];
    [defaults synchronize];
    
}

/*
 Method showBusPins
 - This method turns bus pins on and off
 */
-(IBAction)showBusPins{
    
    // Handles the click of the switch
    bool buspins;
    if (self.showbusswitch.on)
        buspins = true;
    else
        buspins = false;
    
    NSLog(@"changing bus value");
    
    // Saves the new value to the property
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:buspins forKey:@"showbuspins"];
    [defaults synchronize];
    
}

/*
 Method showMuseumPins
 - This method turns museum pins on and off
 */
-(IBAction)showMuseumPins{
    
    // Handles the click of the switch
    bool museumpins;
    if (self.showmuseumswitch.on)
        museumpins = true;
    else
        museumpins = false;
    
    NSLog(@"changing museum value");
    
    // Saves the new value to the property
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:museumpins forKey:@"showmuseumpins"];
    [defaults synchronize];
    
}

/*
 Method viewDidLoad
 - This is the starting method for the view
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set the starting positions of the switches
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    bool bpins = [defaults boolForKey:@"showbuspins"];
    bool mpins = [defaults boolForKey:@"showmuseumpins"];
    int  cloc  = [defaults integerForKey:@"constantLocation"];
    
    if (bpins == true)
        [self.showbusswitch setOn:YES animated:NO];
    else
        [self.showbusswitch setOn:NO animated:NO];
    
    if (mpins == true)
        [self.showmuseumswitch setOn:YES animated:NO];
    else
        [self.showmuseumswitch setOn:NO animated:NO];
    
    if (cloc == 1)
        [self.alwaysonswitch setOn:YES animated:NO];
    else
        [self.alwaysonswitch setOn:NO animated:NO];
}

/*
 Method done
 - Handles the closing of the setting view
 */
- (IBAction) done {
    // Need to call calling window
    [_delegate didSomethingHappen:@"closedsettings"];
    
    // Close the Modal Settings Window
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)viewDidAppear:(BOOL)animated{
    
    // Get the current count of saved buses
    NSMutableArray *totalBusArray = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"myFavoritesBus"]];
    
    NSString *favend = @" saved favorites";
    self.totalBusFavs.text = [NSString stringWithFormat:@"%i%@", [totalBusArray count], favend];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
