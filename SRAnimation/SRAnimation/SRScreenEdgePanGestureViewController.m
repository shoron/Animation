//
//  SRScreenEdgePanGestureViewController.m
//  SRAnimation
//
//  Created by shoron on 15/11/9.
//  Copyright © 2015年 com. All rights reserved.
//

#import "SRScreenEdgePanGestureViewController.h"

@interface SRScreenEdgePanGestureViewController ()

@end

@implementation SRScreenEdgePanGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addScreenEdgePanGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addScreenEdgePanGesture {
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePanGestureHandler:)];
    gesture.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:gesture];
}

- (void)screenEdgePanGestureHandler:(id)gesture {
    if (((UIScreenEdgePanGestureRecognizer *)gesture).state != UIGestureRecognizerStateEnded) {
        return;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
