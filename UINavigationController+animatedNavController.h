//
//  UINavigationController+customNavController.h
//  animtest
//
//  Created by Craig Merchant on 05/12/2011.
//  Copyright (c) 2011 Craig Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UINavigationController (animatedNavController)

- (void) pushWithAnim:(UIViewController*)viewController inView:(UIView*)view;
- (void) pushWithAnim:(UIViewController*)viewController inView:(UIView*)view withAnchor:(CGPoint)anchor;
- (void) shrinkLastViewController;
- (void) animationDidStop:(NSString *)animationID finished:(BOOL)finished context:(id)context;

@end
