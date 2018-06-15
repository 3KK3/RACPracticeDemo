//
//  ZMJServiceProtocol.h
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJRequestProtocol.h"

@protocol ZMJServiceProtocol <NSObject>

@optional
- (id <ZMJRequestProtocol>)getHomePageService;
- (id <ZMJRequestProtocol>)getHomePageDetailService;

@end
