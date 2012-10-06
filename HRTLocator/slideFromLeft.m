//
//  slideFromLeft.m
//  HRTLocator
//
//  Created by Jason Wogan on 10/5/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "slideFromLeft.h"

@implementation slideFromLeft

- (void) perform {
    
    UIView *oldView = ((UIViewController *)self.sourceViewController).view;
    UIView *newView = ((UIViewController *)self.destinationViewController).view;
    
    [oldView.window insertSubview:newView aboveSubview:oldView];
    float offsetY = newView.center.y  - oldView.center.y ;
    //NSLog(@"old y = %f, new y = %f , offsetY = %f", oldView.center.y, newView.center.y, offsetY);
    
    
    // assuming newView and oldView both sized to fill screen,
    //   position newView just to the right of oldView
    
    newView.center = CGPointMake(oldView.center.x + oldView.frame.size.width, oldView.center.y + offsetY);
    //NSLog(@"newView center x = %f y = %f", newView.center.x, newView.center.y);
    // slide newView over oldView, then remove oldView
    [UIView animateWithDuration:0.3
                     animations:^{ newView.center = CGPointMake(oldView.center.x, oldView.center.y + offsetY);}
                     completion:^(BOOL finished){ [oldView removeFromSuperview]; }];
    
    
    
}


@end
