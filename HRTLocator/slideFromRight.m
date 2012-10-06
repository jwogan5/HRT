//
//  slideFromRight.m
//  HRTLocator
//
//  Created by Jason Wogan on 10/5/12.
//  Copyright (c) 2012 frigidpixel.com. All rights reserved.
//

#import "slideFromRight.h"

@implementation slideFromRight

- (void) perform {
    
    UIView *oldView = ((UIViewController *)self.sourceViewController).view;
    UIView *newView = ((UIViewController *)self.destinationViewController).view;
    
    [oldView.window insertSubview:newView aboveSubview:oldView];
    float offsetY = newView.center.y  + oldView.center.y ;
 
    newView.center = CGPointMake(oldView.center.x - oldView.frame.size.width, oldView.center.y + offsetY);

    [UIView animateWithDuration:0.3
                     animations:^{ newView.center = CGPointMake(oldView.center.x, oldView.center.y + offsetY);}
                     completion:^(BOOL finished){ [oldView removeFromSuperview]; }];
    
    
    
}


@end
