//
//  SRTextAndImageViewController.h
//  SRAnimation
//
//  Created by shoron on 15/11/9.
//  Copyright © 2015年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 这个viewController中的效果也可以在转场动画中使用
 */

@protocol SRImageAnimationsViewControllerDelegate <NSObject>

- (void)imageAnimationsViewControllerDidStop;

@end

@interface SRImageAnimationsViewController : UIViewController

@property (weak, nonatomic) id<SRImageAnimationsViewControllerDelegate> delegate;

@end
