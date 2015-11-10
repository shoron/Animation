//
//  SRImageViewController.m
//  SRAnimation
//
//  Created by shoron on 15/11/9.
//  Copyright © 2015年 com. All rights reserved.
//

#import "SRImageViewController.h"
#import "SRImageAnimationsViewController.h"
#import "SRFadeInAnimator.h"
#import "SRFadeOutAnimator.h"

@interface SRImageViewController () <UIViewControllerTransitioningDelegate, SRImageAnimationsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SRImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.imageView setImage:self.image];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)presentButtonHandler:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SRImageAnimationsViewController *imageAnimationsViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SRImageAnimationsViewController class])];
    imageAnimationsViewController.transitioningDelegate = self;
    imageAnimationsViewController.delegate = self;
    [self presentViewController:imageAnimationsViewController animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    if ([presented isKindOfClass:[SRImageAnimationsViewController class]]) {
        return [[SRFadeInAnimator alloc] init];
    }
    return nil;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if ([dismissed isKindOfClass:[SRImageAnimationsViewController class]]) {
        return [[SRFadeInAnimator alloc] init];
    }
    return nil;
}

#pragma mark - SRImageAnimationsViewControllerDelegate

- (void)imageAnimationsViewControllerDidStop {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
