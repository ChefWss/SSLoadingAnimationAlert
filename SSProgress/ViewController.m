//
//  ViewController.m
//  SSProgress
//
//  Created by WSS on 2018/12/21.
//  Copyright © 2018 WSS. All rights reserved.
//

#import "ViewController.h"
#import "SSProgress.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *showBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlert:(id)sender {
    [[SSProgress shareInstence] showloading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[SSProgress shareInstence] hidLoading];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
