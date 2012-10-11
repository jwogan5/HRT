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
    
    // Get Bus Favorites Array
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *busFavs = [defaults objectForKey:@"myFavoritesBus"];
    
    int totalBusCount = [busData count];
    int totalFavs = [busFavs count];
    
    if (totalBusCount == 0)
       busData = [[NSMutableArray alloc] init];
    
    // Loop over bus Data and set lastupdate
    if ([busData count] > 0)
    { 
        for (int ld=0; ld < totalBusCount; ld++)
        {
            Bus *currentBus = [busData objectAtIndex:ld];
            int currentLastUpdate = [currentBus getLastUpdate];
            currentLastUpdate++;
            
            // Remove the object at the index
            [busData removeObjectAtIndex:ld];
            
            // Add the object back in
            if (currentLastUpdate >= 5)
                [busData insertObject:currentBus atIndex:ld];
        }
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
                int foundIndex;
                int currentBusNumber = [[hrtLineDataArray objectAtIndex:(2)] intValue];
                
                // Build the Bus Object
                Bus *bus = [[Bus alloc]init];
                [bus setNumber:currentBusNumber];
                [bus setLocation:[hrtLineDataArray objectAtIndex:(3)]];
                [bus setLastUpdate:1];
                
                // Build Bus Extra Data
                if ( [[hrtLineDataArray objectAtIndex:(6)] isEqualToString:[[NSString alloc] initWithFormat:@"V"]] )
                    [bus setAdherence:[[hrtLineDataArray objectAtIndex:(5)] intValue]];
                else
                    [bus setAdherence:0];
                
                // Set Bus Favorite
                [bus setFavorite:false];
                for (int f = 0; f < totalFavs; f++)
                {
                    int cfav = [[busFavs objectAtIndex:f] intValue];
                    if ([bus getNumber] == cfav)
                        [bus setFavorite:true];
                }
                 
                // Do we have route data
                if ([hrtLineDataArray count] > 7)
                {
                    [bus setRoute:[[hrtLineDataArray objectAtIndex:(7)] intValue]];
                    [bus setDirection:[[hrtLineDataArray objectAtIndex:(8)] intValue]];
                    [bus setStop:[[hrtLineDataArray objectAtIndex:(9)] intValue]];
                }
                
                // Does Bus Object Exist
                for ( int b = 0; b < totalBusCount; b++)
                {
                    Bus *currentBus = [busData objectAtIndex:b];
                    int busNum = [currentBus getNumber];
                    if (busNum == currentBusNumber)
                    {
                        found = true;
                        foundIndex = b;
                    }
                }
                
                if (found == true)
                {
                    [busData removeObjectAtIndex:foundIndex];
                    [busData insertObject:bus atIndex:foundIndex];
                }
                else
                {
                    [busData addObject:bus];
                }
            }
        }
    }
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
