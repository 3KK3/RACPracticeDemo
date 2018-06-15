
//
//  ZMJHomeDetailViewModel.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJHomeDetailViewModel.h"

@interface ZMJHomeDetailViewModel ()

@property (nonatomic, strong) NSString *requestUrlStr;

@end


@implementation ZMJHomeDetailViewModel

- (instancetype)initWithServiceImpl:(id<ZMJServiceProtocol>)serviceImpl params:(NSDictionary *)params {
    _requestUrlStr = params[@"requestUrl"];
    return self;
}

- (void)initailize {
    [super initailize];

}

- (RACSignal *)executeRequestDataSignal:(id)input {
    
    return nil;
    
//    if ([input integerValue] == RealStatusNotReachable) {
//        self.networkStatus = RealStatusNotReachable;
//        return [RACSignal empty];
//    } else {
//        return [[[self.serviceImpl getHomePageDetailService] requestFindPageDataSignalByUrlStr: self.requestUrlStr] doNext:^(id  _Nullable x) {
//        }];
//    }
}

@end
