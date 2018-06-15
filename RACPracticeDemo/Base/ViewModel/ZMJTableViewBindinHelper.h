//
//  ZMJTableViewBindinHelper.h
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZMJBaseViewModel;

@interface ZMJTableViewBindinHelper : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView
                     sourceSignal:(RACSignal *)sourceSingal
                 selectionCommand:(RACCommand *)didSelectionCommand
                     cellClassStr:(NSString *)cellClassStr
                    withViewModel:(ZMJBaseViewModel *)viewModel;

@end
