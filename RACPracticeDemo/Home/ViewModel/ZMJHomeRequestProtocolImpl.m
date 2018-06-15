//
//  ZMJHomeRequestProtocolImpl.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJHomeRequestProtocolImpl.h"

@interface ZMJHomeRequestProtocolImpl ()

@property (nonatomic, strong) NSMutableArray *itemData;
@property (nonatomic, strong) NSMutableDictionary *homeData;
@property (nonatomic, assign) NSString *next_start;

@end

@implementation ZMJHomeRequestProtocolImpl

- (RACSignal *)requestHomePageDataSignalByUrlStr:(NSString *)urlStr {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       @strongify(self)
        
        NSLog(@"首页RequestProtocolImpl  拿到url：%@ 开始请求网络数据",urlStr);
        
        NSLog(@"首页RequestProtocolImpl 请求结束 准备调用sendNext发送数据");
        
        BOOL succeed = YES;
        
        if (succeed) { //请求成功
                       
            [subscriber sendNext: @[@"1",@"2"]];
            [subscriber sendCompleted];
            
        } else { //请求错误
            [subscriber sendNext: @"error"];
            [subscriber sendCompleted];
        }
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

- (RACSignal *)requestHomePageMoreDataSignalByUrlStr:(NSString *)urlStr {
    //....  仿照上面 👆
    return [RACSignal empty];//
}

@end
