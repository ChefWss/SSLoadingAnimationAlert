//
//  SSLoadingAnimationAlert.m
//  SSLoadingAnimationAlert
//
//  Created by 王少帅 on 2020/11/3.
//

#import "SSLoadingAnimationAlert.h"
#import "SSProgress.h"

@implementation SSLoadingAnimationAlert

- (void)SSshowloading
{
    [[SSProgress shareInstence] showloading];
}

- (void)SShidLoading
{
    [[SSProgress shareInstence] hidLoading];
}

@end
