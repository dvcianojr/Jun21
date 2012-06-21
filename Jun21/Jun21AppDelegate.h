//
//  Jun21AppDelegate.h
//  Jun21
//
//  Created by Dominick Ciano on 6/16/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;
@class Caption;
@interface Jun21AppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
	Caption *caption;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end
