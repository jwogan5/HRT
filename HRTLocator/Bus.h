//
//  Bus.h
//  HRTLocator
//
//  Created by Jason Wogan on 10/5/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bus : NSObject
{
    int number;
    NSString *location;
    int adherence;
    int route;
    int direction;
    int stop;
    bool favorite;
    float lat;
    float lon;
    int lastUpdate;
}

// Set and Get the Bus Number
-(void)setNumber:(int)a;
-(int)getNumber;

// Set and Get the Bus Location
-(void)setLocation:(NSString *) a;
-(NSString *)getLocation;
-(float)getLat;
-(float)getLon;

// Set and Get the Bus adherence
-(void)setAdherence:(int)a;
-(int)getAdherence;

// Set and Get the Bus route
-(void)setRoute:(int)a;
-(int)getRoute;

// Set and Get the Bus direction
-(void)setDirection:(int)a;
-(int)getDirection;

// Set and Get the Bus stop
-(void)setStop:(int)a;
-(int)getStop;

// Set and Get the Bus favorite
-(void)setFavorite:(bool)b;
-(int)getFavorite;

// Set and Get the Bus last update
-(void)setLastUpdate:(int)a;
-(int)getLastUpdate;

@end
