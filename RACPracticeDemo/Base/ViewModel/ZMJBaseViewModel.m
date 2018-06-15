//
//  ZMJBaseViewModel.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJBaseViewModel.h"

@interface ZMJBaseViewModel ()

@property (strong, nonatomic, readwrite) RACCommand *requestCommand;
@property (copy, nonatomic, readwrite) NSString *title;
@property (strong, nonatomic, readwrite) id<ZMJServiceProtocol> serviceImpl;

@end

@implementation ZMJBaseViewModel

- (instancetype)initWithServiceImpl:(id<ZMJServiceProtocol>)serviceImpl params:(NSDictionary *)params {
    if (self = [super init]) {
        
        self.serviceImpl = serviceImpl;
        self.title = params[@"title"];
        @weakify(self)
        self.requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
            NSLog(@"base VM 拿到网络状态: %@，开始准备网络请求",input);
            
            @strongify(self)
            return [[self executeRequestDataSignal: input] takeUntil: self.rac_willDeallocSignal];
        }];
    }
    return self;
}

- (void)initailize {
    
}

- (RACSignal *)executeRequestDataSignal:(id)input {
    return [RACSignal empty];
}




@end
