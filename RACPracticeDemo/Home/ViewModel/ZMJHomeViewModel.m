//
//  ZMJHomeViewModel.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJHomeViewModel.h"
#import "ZMJHomeModel.h"
#import "ZMJServiceProtocolImpl.h"
#import "ZMJHomeDetailViewModel.h"
#import "ZMJHomeDetailViewContoller.h"

@implementation ZMJHomeViewModel

- (instancetype)initWithServiceImpl:(id<ZMJServiceProtocol>)serviceImpl params:(NSDictionary *)params {
    if (self = [super initWithServiceImpl: serviceImpl params: params]) {
        [self initailize];
    }
    return self;
}

- (void)initailize {
    [super initailize];
    @weakify(self)
    
    self.requestMoreDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self)
        
        NSLog(@"home VM requestMoreDataCommand:拿到请求准备数据 开始准备网络请求");
        
        return [[[self.serviceImpl getHomePageService] requestHomePageDataSignalByUrlStr: @"home"] doNext:^(id  _Nullable x) {
            NSLog(@"home VM  信号:拿到数据请求结果 保存数据");
            self.homeData = x[@"homeData"];
        }];
    }];
    
    self.jumptDetailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        ZMJHomeModel *itemModel = input;
        NSString *detailRequestUrl = itemModel.url;
        
        ZMJServiceProtocolImpl *serviceImpl = [[ZMJServiceProtocolImpl alloc] initServiceProtocolImpl];
        
        ZMJHomeDetailViewModel *detailViewModel = [[ZMJHomeDetailViewModel alloc] initWithServiceImpl: serviceImpl params: @{@"requesturl": detailRequestUrl}];
        
        ZMJHomeDetailViewContoller *detailVC = [[ZMJHomeDetailViewContoller alloc] initWithViewModel: detailViewModel];

        NSLog(@"页面跳转到detail %@",detailVC);
        
        return [RACSignal empty];
    }];
    
    self.requestErrorSignal = self.requestMoreDataCommand.errors;
}

- (RACSignal *)executeRequestDataSignal:(id)input {
    
    NSLog(@"home VM  拿到网络状态：%@  判断是否进行初次网络数据请求",input);
    
    if ([input integerValue] == RealStatusNotReachable) {
        
        self.networkStatus = RealStatusNotReachable;
        return [RACSignal empty];
        
    }else{
        NSLog(@"home VM 网络正常， 通过给请求具体类传请求地址url  进行页面初次网络请求");
        @weakify(self);
        
        return [[[self.serviceImpl getHomePageService] requestHomePageDataSignalByUrlStr: @"url"] doNext:^(id  _Nullable result) {
            
            @strongify(self);
            self.homeData = result;
            NSLog(@"home VM  得到请求数据: %@",result);

        }];
    }
    
}


@end
