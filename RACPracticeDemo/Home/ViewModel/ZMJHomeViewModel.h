//
//  ZMJHomeViewModel.h
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJBaseViewModel.h"

@interface ZMJHomeViewModel : ZMJBaseViewModel

@property (nonatomic, strong) RACSignal *requestErrorSignal;
@property (nonatomic, strong) RACCommand *requestMoreDataCommand;
@property (nonatomic, strong) RACSignal *requestMoreDataErrorSignal;
@property (nonatomic, strong) RACCommand *jumptDetailCommand;
@property (nonatomic, copy) NSArray *homeData;
@property (nonatomic, copy) NSArray *bannerData;

@end
