//
//  mapCollections.m
//  HRTLocator
//
//  Created by Jason on 10/10/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "mapCollections.h"


@implementation mapCollections



-(void)loadHRTBusData{
    
    int totalBusCount = [busData count];
    
    // Loop over bus Data and set lastupdate
    if ([busData count] > 0)
    {
         // Set LastUpdate to plus 1
        
         // if last update becomes 5 then reomove it from the array
            // subtract one from totalBusCount
    }
    
    // Get the Bus Data from HRT
    NSArray *hrtBusDataArray = [[[NSString alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"ftp://216.54.15.3/Anrd/hrtrtf.txt"]] encoding:NSUTF8StringEncoding] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    for (int i = 1; i < [hrtBusDataArray count]; i++)
    {
        NSString *hrd = [hrtBusDataArray objectAtIndex:(i)];
        if (hrd.length > 1)
        {
            NSArray *hrtLineDataArray = [hrd componentsSeparatedByString:@","];
            
            // Check if location is valid
            if ( [[hrtLineDataArray objectAtIndex:(4)] isEqualToString:[[NSString alloc] initWithFormat:@"V"]] )
            {
                // Temp vars
                bool found = false;
                bool routeDataPresent = false;
                
                // Do we have route data
                if ([hrtLineDataArray count] > 7)
                    routeDataPresent = true;
                
                // Build the Bus Object
                Bus *bus = [[Bus alloc]init];
                [bus setNumber:[[hrtLineDataArray objectAtIndex:(2)] intValue]];
                [bus setLocation:[hrtLineDataArray objectAtIndex:(3)]];
                
                /*
                int adherence;
                int route;
                int direction;
                int stop;
                */
                // Does Bus Object Exist
                for ( int b = 0; b < totalBusCount; b++)
                {
                    
                }
                
                if (found == false)
                {
                    // if yes then update current bus object
                    //NSLog(@"The Bus Number is : %@",lineBusNum);
                }
                else
                {
                    // if not make a new bus object in array
                }
            }
        }
    }
    
    
    // Add Bus Node to busData Array
    /*
    
    NSLog(@"Bus number is %i",[bus getNumber]);
    NSLog(@"Bus lat is : %f",[bus getLat]);
    NSLog(@"Bus lon is : %f",[bus getLon]);
     */
    

}


-(NSMutableArray *)getBusData{
    return busData;
}

-(NSMutableArray *)getTrainData{
    return trainData;
}

-(NSMutableArray *)getVenueData{
    return venueData;
}



@end
