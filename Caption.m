//
//  Caption.m
//  Jun21
//
//  Created by Dominick Ciano on 6/18/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "Caption.h"

@implementation Caption

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void) drawRect: (CGRect) rect
{
	//display caption
	[self displayString: [NSString stringWithFormat: @"       The Avengers"], 1];
}
// Display message 
- (void) displayString:(NSString *)msg, int line {
// set font
UIFont *font = [UIFont systemFontOfSize: 32.0];

CGPoint point = CGPointMake(0.0, (line - 1) * 20.0);
[msg drawAtPoint: point withFont: font];

}

@end
