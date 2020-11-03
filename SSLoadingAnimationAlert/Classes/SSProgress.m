//
//  SSProgress.m
//  OpenWallet
//
//  Created by WSS on 2018/12/21.
//  Copyright © 2018 WSS. All rights reserved.
//

#import "SSProgress.h"

@implementation SSProgress

#define kPERCENT(f)                         (f * [UIScreen mainScreen].bounds.size.width / 375.00)
#define WIDTH                               [UIScreen mainScreen].bounds.size.width
#define HEIGHT                              [UIScreen mainScreen].bounds.size.height

+ (instancetype)shareInstence {
    static SSProgress * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SSProgress alloc]init];
    });
    return instance;
}

- (void)showloading
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self.bgV];
    [self.bgV addSubview:self.blackView];
    NSLog(@"showloading");
}

- (void)hidLoading
{
    [self.bgV removeFromSuperview];
    NSLog(@"hidLoading");
}

- (UIView *)bgV
{
    if (!_bgV) {
        _bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _bgV.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    return _bgV;
}

- (UIView *)blackView
{
    if (!_blackView) {
        _blackView = [[UIView alloc] initWithFrame:CGRectMake((WIDTH-kPERCENT(64))*.5, HEIGHT*.5-kPERCENT(64), kPERCENT(64), kPERCENT(64))];
        _blackView.layer.cornerRadius = kPERCENT(2);
        _blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        
        CGFloat kSpaceBetweenRect = 3.0;
        NSInteger kRectCount = 5;
        
        UIView *loadingView = [[UIView alloc] initWithFrame:CGRectMake(kPERCENT(12), kPERCENT(12), kPERCENT(40), kPERCENT(40))];
        [_blackView addSubview:loadingView];
        
        CGFloat rectWidth = (loadingView.frame.size.width - kSpaceBetweenRect *(kRectCount-1)) / kRectCount;
        for (NSInteger i = 0; i < kRectCount; ++i) {
            CALayer *layer = [CALayer layer];
            layer.transform =  CATransform3DMakeScale(1.0, 0.4, 0.0);
            layer.backgroundColor = [UIColor lightGrayColor].CGColor;
            layer.frame = CGRectMake(i * (rectWidth + kSpaceBetweenRect), 0, rectWidth, loadingView.frame.size.height);
            [loadingView.layer addSublayer:layer];
        }
        
        
        for (NSInteger i = 0; i < kRectCount; ++i) {
            CALayer *layer = loadingView.layer.sublayers[i];
            CAKeyframeAnimation *animation =  [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            animation.removedOnCompletion = NO;
            animation.repeatCount = INTMAX_MAX;
            animation.duration = .8f;
            
            animation.beginTime = CACurrentMediaTime() + i * 0.1;
            animation.keyTimes = @[@0.0,@0.2, @0.4,@1.0];
            animation.timingFunctions = @[
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                          ];
            animation.values = @[
                                 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.4, 0.0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.4, 0.0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.4, 0.0)]
                                 ];
            [layer addAnimation:animation forKey:[NSString stringWithFormat:@"wave_animation_%lu",i]];
        }
    }
    return _blackView;
}

@end
