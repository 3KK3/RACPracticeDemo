//
//  ZMJBaseViewController.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/14.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJBaseViewController.h"
#import "ZMJBaseViewModel.h"

@interface ZMJBaseViewController ()

@property (nonatomic, strong, readwrite) ZMJBaseViewModel *viewModel;
@end

@implementation ZMJBaseViewController

- (instancetype)initWithViewModel:(ZMJBaseViewModel *)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
}

- (void)bindViewModel {
    @weakify(self)
    
    [RACObserve(ZMJAPPDelegate,netWorkStatus) subscribeNext:^(NSNumber  *x) {
       @strongify(self)
        switch ([x integerValue]) {
            case RealStatusUnknown:
            case RealStatusNotReachable: {
                [self.viewModel.requestCommand execute: @(RealStatusNotReachable)];
            }
                break;
            default: {
                [self.viewModel.requestCommand execute: x];
            }
                break;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
