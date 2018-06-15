//
//  ZMJBingVMProtocol.h
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#ifndef ZMJBingVMProtocol_h
#define ZMJBingVMProtocol_h
@class ZMJBaseViewModel;

@protocol ZMJBingVMProtocol

- (void)bindingVM:(ZMJBaseViewModel *)viewModel;
@end

#endif /* ZMJBingVMProtocol_h */
