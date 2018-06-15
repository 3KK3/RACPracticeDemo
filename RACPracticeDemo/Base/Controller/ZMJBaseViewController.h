//
//  ZMJBaseViewController.h
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/14.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZMJBaseViewModel;

@interface ZMJBaseViewController : UIViewController

@property (nonatomic, strong, readonly) ZMJBaseViewModel *viewModel;

- (instancetype)initWithViewModel:(ZMJBaseViewModel *)viewModel;

- (void)bindViewModel;

@end
