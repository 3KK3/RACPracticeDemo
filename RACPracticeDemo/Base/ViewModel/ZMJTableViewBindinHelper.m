

//
//  ZMJTableViewBindinHelper.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJTableViewBindinHelper.h"
#import "ZMJBaseViewModel.h"
#import "ZMJBingVMProtocol.h"

@interface ZMJTableViewBindinHelper () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) RACCommand *didSelectionCommand;
@property (copy, nonatomic) NSString *cellClassStr;
@property (strong, nonatomic) ZMJBaseViewModel  *viewModel;

@end

@implementation ZMJTableViewBindinHelper

- (instancetype)initWithTableView:(UITableView *)tableView sourceSignal:(RACSignal *)sourceSingal selectionCommand:(RACCommand *)didSelectionCommand cellClassStr:(NSString *)cellClassStr withViewModel:(ZMJBaseViewModel *)viewModel {
    
    if (self = [super init]) {
        self.cellClassStr = cellClassStr;
        
        self.tableView = tableView;
     
        [sourceSingal subscribeNext:^(id  _Nullable x) {
            self.dataArray = x;
            [self.tableView reloadData];
        }];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        Class cell =  NSClassFromString(cellClassStr);
        [self.tableView registerClass:cell forCellReuseIdentifier: cellClassStr];
        
        self.didSelectionCommand = didSelectionCommand;
        
        [viewModel.requestCommand.executing subscribeNext:^(NSNumber * _Nullable x) {
            
            UIView *defaultHolderViw = [self.tableView.subviews.rac_sequence objectPassingTest:^BOOL(__kindof UIView * _Nullable value) {
                return value.tag == 1000;
            }];
            defaultHolderViw.alpha = 1 - x.floatValue;
        }];
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id <ZMJBingVMProtocol> cell = [tableView dequeueReusableCellWithIdentifier: self.cellClassStr];
    [cell bindingVM: self.viewModel];
    return (UITableViewCell *)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.didSelectionCommand execute:self.dataArray[indexPath.row]];

}


@end
