//
//  SSProgress.h
//  OpenWallet
//
//  Created by WSS on 2018/12/21.
//  Copyright © 2018 WSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSProgress : NSObject

+ (instancetype)shareInstence;
- (void)showloading;
- (void)hidLoading;

@property (nonatomic, strong) UIView *bgV;
@property (nonatomic, strong) UIView *blackView;

@end
