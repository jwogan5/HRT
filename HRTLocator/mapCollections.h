//
//  mapCollections.h
//  HRTLocator
//
//  Created by Jason on 10/10/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bus.h"

@interface mapCollections : NSObject{
    NSMutableArray *busData;
    NSMutableArray *trainData;
    NSMutableArray *venueData;
}

-(void)loadHRTBusData;
-(NSMutableArray *)getBusData;
-(NSMutableArray *)getTrainData;
-(NSMutableArray *)getVenueData;


@end
