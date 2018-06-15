//
//  ZMJBaseViewModel.h
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJServiceProtocol.h"

@interface ZMJBaseViewModel : NSObject

@property (strong, nonatomic, readonly) RACCommand *requestCommand;
@property (assign, nonatomic) ReachabilityStatus networkStatus;
@property (copy, nonatomic, readonly) NSString *title;
@property (strong, nonatomic, readonly) id<ZMJServiceProtocol> serviceImpl;

- (instancetype)initWithServiceImpl:(id <ZMJServiceProtocol>)serviceImpl params:(NSDictionary *)params;
- (void)initailize;

- (RACSignal *)executeRequestDataSignal:(id)input;

@end
