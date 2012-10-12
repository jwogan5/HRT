//
//  busFavoriteController.m
//  HRTLocator
//
//  Created by Jason on 10/12/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "busFavoriteController.h"

@interface busFavoriteController ()

@end

@implementation busFavoriteController

@synthesize busfavtable;


/*
 Method done
 - Handles the closing of the setting view
 */
- (IBAction) done {
    
    // Close the Modal Settings Window
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    busfavtable.layer.cornerRadius = 10;
    
    
    // Setup the bus fav array
    busFavs = [[NSMutableArray alloc] init];
    [busFavs addObject:@"2415"];
    [busFavs addObject:@"1"];
    [busFavs addObject:@"2"];
    [busFavs addObject:@"3"];
    [busFavs addObject:@"4"];
    [busFavs addObject:@"5"];
    [busFavs addObject:@"6"];
    [busFavs addObject:@"7"];
    [busFavs addObject:@"8"];
    
    NSLog(@"Bus array has length of : %i", [busFavs count]);
    
    

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // return 2;
    return [busFavs count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [busFavs removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"busCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    NSString *cellValue = [busFavs objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    // Configure the cell...
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
