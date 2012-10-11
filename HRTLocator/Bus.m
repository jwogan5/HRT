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
    
    // Split the location on slash
    NSArray *gpsArray = [a componentsSeparatedByString:@"/"];
    NSString *gpslat = [gpsArray objectAtIndex:0];
    NSString *gpslon = [gpsArray objectAtIndex:1];
    NSString *gpslatbegin = [gpslat substringWithRange:NSMakeRange(0,2)];
    NSString *gpslonbegin = [gpslon substringWithRange:NSMakeRange(0,3)];
    NSString *gpslatend = [gpslat substringWithRange:NSMakeRange(2,gpslat.length - 2)];
    NSString *gpslonend = [gpslon substringWithRange:NSMakeRange(3,gpslon.length - 3)];
    
    lat = [[NSString stringWithFormat:@"%@%s%@", gpslatbegin, ".", gpslatend] floatValue];
    lon = [[NSString stringWithFormat:@"%@%s%@", gpslonbegin, ".", gpslonend] floatValue];
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
