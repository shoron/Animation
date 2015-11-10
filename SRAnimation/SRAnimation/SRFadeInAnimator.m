//
//  GCHIFadeAnimator.m
//  GUECHI
//
//  Created by WangShaopeng on 9/15/15.
//  Copyright (c) 2015 GUECHI. All rights reserved.
//

#import "SRFadeInAnimator.h"

@implementation SRFadeInAnimator

// 这个duration可以写成property。来根据不同的page，设置不同的动画时长。
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.7f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    
    [containerView addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toViewController.view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
