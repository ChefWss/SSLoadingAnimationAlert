//
//  SSViewController.m
//  SSLoadingAnimationAlert
//
//  Created by wang_shaoshuai@sina.cn on 11/03/2020.
//  Copyright (c) 2020 wang_shaoshuai@sina.cn. All rights reserved.
//

#import "SSViewController.h"
#import <SSLoadingAnimationAlert.h>

@interface SSViewController ()

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.orangeColor;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SSLoadingAnimationAlert.new SSshowloading];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SSLoadingAnimationAlert.new SShidLoading];
        });
    });
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
