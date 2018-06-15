//
//  ZMJHomeViewController.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ZMJHomeViewController.h"
#import "ZMJBaseViewModel.h"
#import "ZMJTableViewBindinHelper.h"
#import "ZMJHomeViewModel.h"

@interface ZMJHomeViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZMJTableViewBindinHelper *bindingHelper;
@property (nonatomic, strong) ZMJHomeViewModel *viewModel;
@end

@implementation ZMJHomeViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)bindViewModel {
    [super bindViewModel];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [[self.viewModel.requestCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable executing) {
        if (!executing.boolValue) {
            NSLog(@"结束刷新");
        }
    }];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, 320, 480) style: UITableViewStylePlain];
    self.tableView.rowHeight = 100;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 0, 0.1)];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 0, 0.1)];
    [self.view addSubview: self.tableView];
    
    self.bindingHelper = [[ZMJTableViewBindinHelper alloc] initWithTableView: self.tableView sourceSignal: RACObserve(self.viewModel,homeData) selectionCommand: self.viewModel.jumptDetailCommand cellClassStr: @"HomeTableViewCell" withViewModel: self.viewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}





@end
