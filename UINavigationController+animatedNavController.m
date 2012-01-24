//
//  UINavigationController+customNavController.m
//  animtest
//
//  Created by Craig Merchant on 05/12/2011.
//  Copyright (c) 2011 Craig Merchant. All rights reserved.
//

#import "UINavigationController+animatedNavController.h"

@implementation UINavigationController (animatedNavController)

- (void) pushWithAnim:(UIViewController*)viewController inView:(UIView*)view
{
    viewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64.0);
    [viewController.view setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
    [view addSubview:viewController.view];

    [UIView beginAnimations:@"animationExpand" context:viewController];
    [UIView setAnimationDuration:0.5];
    viewController.view.transform=CGAffineTransformMakeScale(1, 1);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView commitAnimations];
}

- (void) pushWithAnim:(UIViewController*)viewController inView:(UIView*)view withAnchor:(CGPoint)anchor
{
    viewController.view.layer.anchorPoint = anchor;
    
    viewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64.0);
    [viewController.view setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
    [view addSubview:viewController.view];
    
    [UIView beginAnimations:@"animationExpand" context:viewController];
    [UIView setAnimationDuration:0.5];
    viewController.view.transform=CGAffineTransformMakeScale(1, 1);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView commitAnimations];
}

- (void) shrinkLastViewController
{
    int beforeint = ([[self viewControllers] count]-2);
    
    if(beforeint < 0)
    {
        return;
    }
    
    UIViewController *vc = [[self viewControllers] lastObject];
    UIViewController *before = [[self viewControllers] objectAtIndex:beforeint];
    
    [before.view addSubview:vc.view];
    
    [self popViewControllerAnimated:NO];
    
    [UIView beginAnimations:@"animationShrink" context:[vc view]];
    [UIView setAnimationDuration:0.5];
    
    [[vc view] setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView commitAnimations];
}

- (void) animationDidStop:(NSString *)animationID finished:(BOOL)finished context:(id)context
{
    if([animationID isEqualToString:@"animationExpand"])
    {
        [self pushViewController:context animated:NO];
        [context release]; context = nil;
    }
    else
    {
        [context removeFromSuperview];
    }

}

@end
