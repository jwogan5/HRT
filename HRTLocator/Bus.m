//
//  Bus.m
//  HRTLocator
//
//  Created by Jason Wogan on 10/5/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "Bus.h"

@implementation Bus

-(void)setNumber:(int)a {
    number = a;
}

-(int)getNumber{
    return number;
}

-(void)setLocation:(NSString *) a{
    location = a;
    lat=36.8463754;
    lon=-76.4590385;
}

-(NSString *)getLocation{
    return location;
}

-(float)getLat{
    return lat;
}

-(float)getLon{
    return lon;
}

-(void)setAdherence:(int)a{
    adherence = a;
}
-(int)getAdherence{
    return adherence;
}

-(void)setRoute:(int)a{
    route = a;
}
-(int)getRoute{
    return route;
}

-(void)setDirection:(int)a{
    direction = a;
}
-(int)getDirection{
    return direction;
}

-(void)setStop:(int)a{
    stop = a;
}
-(int)getStop{
    return stop;
}

-(void)setFavorite:(bool)b{
    favorite = b;
}
-(int)getFavorite{
    return favorite;
}

-(void)setLastUpdate:(int)a{
    lastUpdate = a;
}
-(int)getLastUpdate{
    return lastUpdate;
}

@end
