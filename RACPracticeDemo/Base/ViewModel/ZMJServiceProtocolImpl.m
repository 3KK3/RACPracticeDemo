//
//  ZMJServiceProtocolImpl.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJServiceProtocolImpl.h"
#import "ZMJHomeRequestProtocolImpl.h"

@interface ZMJServiceProtocolImpl ()

@property (nonatomic, strong) ZMJHomeRequestProtocolImpl *homeRequestImpl;

@end

@implementation ZMJServiceProtocolImpl

- (id <ZMJRequestProtocol>)getHomePageService {
    return self.homeRequestImpl;
    
}
- (id <ZMJRequestProtocol>)getHomePageDetailService {
    return self.homeRequestImpl;
}

- (instancetype)initServiceProtocolImpl {
    if (self = [super init]) {
        self.homeRequestImpl = [[ZMJHomeRequestProtocolImpl alloc] init];
    }
    return self;
}


@end
