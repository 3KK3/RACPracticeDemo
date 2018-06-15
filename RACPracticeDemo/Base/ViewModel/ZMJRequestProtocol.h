//
//  ZMJRequestProtocol.h
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZMJRequestProtocol <NSObject>
@optional

// 加载首页数据
- (RACSignal *)requestHomePageDataSignalByUrlStr:(NSString *)urlStr;

// 加载首页更多数据
- (RACSignal *)requestHomePageMoreDataSignalByUrlStr:(NSString *)urlStr;

// 加载首页详情数据
- (RACSignal *)requestHomePageDetailDataSignalByUrlStr:(NSString *)urlStr;

@end
