//
//  SRTextAndImageViewController.m
//  SRAnimation
//
//  Created by shoron on 15/11/9.
//  Copyright © 2015年 com. All rights reserved.
//

#import "SRImageAnimationsViewController.h"

#define DURATION 0.7f
#define IMAGE1 @"1"
#define IMAGE2 @"2"

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    Enlarge,                    //放大
    EnlargeReduceEnlarge,       //放大缩小放大
} AnimationType;

@interface SRImageAnimationsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) int subtype;

@end

@implementation SRImageAnimationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.subtype = 0;
    self.imageView.image = [UIImage imageNamed:IMAGE2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImageViewWithImageName:(NSString *)name {
    [self.imageView setImage:[UIImage imageNamed:name]];
}

#pragma mark - UIButton Handler

/*
 由CATransition创建的动画
 */
- (IBAction)caTransitionButton:(id)sender {
    
    UIButton *button = sender;
    AnimationType animationType = button.tag;
    
    NSString *subtypeString;
    
    switch (_subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    _subtype += 1;
    if (_subtype > 3) {
        _subtype = 0;
    }
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.imageView];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.imageView];
            break;
        default:
            break;
    }
    
    static int i = 0;
    if (i == 0) {
        [self setImageViewWithImageName:IMAGE1];
        i = 1;
    }
    else
    {
        [self setImageViewWithImageName:IMAGE2];
        i = 0;
    }
}

/*
 view 自带的动画
 */
- (IBAction)viewAnimationButtonhandler:(id)sender {
    UIButton *button = sender;
    AnimationType animationType = button.tag;

    switch (animationType) {
        case CurlDown:
            [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
        case PageCurl:
        {

        }
            break;
        default:
            break;
    }
}

- (IBAction)transformButtonHandler:(id)sender {
    UIButton *button = sender;
    AnimationType animationType = button.tag;
    switch (animationType) {
        case Enlarge:
        {
            CABasicAnimation *animation;
            animation=[CABasicAnimation animationWithKeyPath:@"transform"];
            animation.duration=DURATION; // animation time
            animation.fromValue = [NSNumber numberWithFloat:0.1];  // 开始时的缩放比例
            animation.toValue = [NSNumber numberWithFloat:2];  // 结束时的缩放比例
            [self.imageView.layer addAnimation:animation forKey:@"animateTransform"];
            break;
        }
        case EnlargeReduceEnlarge:
        {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            NSMutableArray *values = [NSMutableArray array];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 1.0)]];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0)]];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
            animation.values = values;
            [self.imageView.layer addAnimation:animation forKey:@"animateTransform"];
        }
        default:
            break;
    }
}

- (IBAction)exitButtonHandler:(id)sender {
    [self.delegate imageAnimationsViewControllerDidStop];
}

#pragma mark - CATransition动画实现
- (void)transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype ForView:(UIView *)view {
    CATransition *animation = [CATransition animation];
    animation.duration = DURATION;      //设置运动时间
    animation.type = type;              //设置运动type
    if (subtype != nil) {
        animation.subtype = subtype;    //设置子类
    }
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}

#pragma mark - UIView实现动画
- (void)animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition)transition {
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}


@end

