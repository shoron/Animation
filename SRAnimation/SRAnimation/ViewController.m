//
//  ViewController.m
//  SRAnimation
//
//  Created by shoron on 15/11/9.
//  Copyright © 2015年 com. All rights reserved.
//

#import "ViewController.h"
#import "SRImageViewController.h"
#import "SRFadeInAnimator.h"
#import "SRFadeOutAnimator.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.delegate = self;
    self.title = @"开始界面";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonHandler:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SRImageViewController *imageViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SRImageViewController class])];
    imageViewController.image = [UIImage imageNamed:@"1"];
    [self.navigationController pushViewController:imageViewController animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    // from self to imageViewController
    if ([fromVC isEqual:self] && [toVC isKindOfClass:[SRImageViewController class]]) {
        SRFadeInAnimator *fadeInAnimator = [[SRFadeInAnimator alloc] init];
        return fadeInAnimator;
    }
    
    // from SRImageViewController to self
    if ([fromVC isKindOfClass:[SRImageViewController class]] && [toVC isEqual:self]) {
        SRFadeOutAnimator *fadeOutAnimator = [[SRFadeOutAnimator alloc] init];
        return fadeOutAnimator;
    }

    return nil;
}

@end
