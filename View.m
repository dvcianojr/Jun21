//
//  View.m
//  Jun21
//
//  Created by Dominick Ciano on 6/17/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "View.h"

@implementation View
CGFloat i = 0.0; // static counter used for fading out image


- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{

    // Drawing code
    CGRect bounds = self.bounds;
    CGFloat radius = .3 * bounds.size.width;	//in pixels
    
    
    // Create the invisible square that will surround the circle and center the circle
	CGRect r = CGRectMake(
						  -radius,
						  -radius,
						  2 * radius,
						  2 * radius
						  );
	
    CGContextRef c = UIGraphicsGetCurrentContext();
	
	CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2); //origin at center 
	CGContextScaleCTM(c, 1, -1);  //make Y axis point up
	
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
	
	//draw circle
    CGContextAddEllipseInRect(c, r);
	CGContextSetLineWidth(c, 20.0); // needed for strokes
	++i; 
	if (i > 10.0) i=1.0; // counter used for fading out image
	CGFloat fAmtOfColor = (i-1.0) / 10.0;
	CGContextSetRGBStrokeColor(c,fAmtOfColor, fAmtOfColor, fAmtOfColor, 1); // as opposed to CGContextSetRGBFillColor(...);
	CGContextSetShadow(c, CGSizeMake(10, -20), 5); // give circle a shadow
	CGContextStrokePath(c);
	
	//draw lines to form "A"
	CGContextTranslateCTM(c,15, 0); // to shift "A" to right
	CGContextBeginPath(c);	
	CGContextSetLineWidth(c, 30.0); // needed for strokes
	CGContextMoveToPoint(c, -radius, -radius);         
	CGContextAddLineToPoint(c, 0, 1.3 * radius);  
	CGContextAddLineToPoint(c, .2 * radius, 1.3 * radius); 
	CGContextAddLineToPoint(c, .2 * radius, 0); 
	CGContextAddLineToPoint(c, -55, 0); 
	CGContextAddLineToPoint(c,19, 0); 
	CGContextAddLineToPoint(c,19, -70); 
	CGContextSetShadow(c, CGSizeMake(10, -20), 5); // give letter "A" a shadow	
	CGContextStrokePath(c); // as opposed to CGContextFillPath(c);
	
	//draw arrow head
	CGContextBeginPath(c);	
	CGContextSetLineWidth(c, 3.0);
	CGContextMoveToPoint(c, 0 + 32, 0);         
	CGContextAddLineToPoint(c, 5, 20);  
	CGContextMoveToPoint(c, 0 + 32, 0); 
	CGContextAddLineToPoint(c, 5, -20); 
    CGContextSetRGBStrokeColor(c, 0.6, 0.6, 0.6, 1);
	CGContextSetShadow(c, CGSizeMake(10, -20), 5); // give arrow head a shadow	
	CGContextStrokePath(c); // as opposed to CGContextFillPath(c);	
	
	
	//separate circle from "A"
	CGContextBeginPath(c);	
	CGContextSetLineWidth(c, 3.0);
	CGContextMoveToPoint(c, -radius+22, -radius +8);         
	CGContextAddLineToPoint(c, -65,-68);   
	CGContextMoveToPoint(c, -radius -4, -radius+32); 
	CGContextAddLineToPoint(c, -90, -41); 
    CGContextSetRGBStrokeColor(c, .6, .6, .6, 1);
	CGContextStrokePath(c); // as opposed to CGContextFillPath(c);	

	
	//redraw every 2 secs fading out
	[self performSelector:@selector(setNeedsDisplay) withObject:nil afterDelay:2];
	
}


@end
