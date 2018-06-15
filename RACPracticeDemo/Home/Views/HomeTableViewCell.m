//
//  HomeTableViewCell.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/15.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "ZMJHomeViewModel.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindingVM:(ZMJBaseViewModel *)viewModel {
    
    ZMJHomeViewModel *homModel = viewModel;
    
    self.contentView.backgroundColor = [UIColor redColor];
    
    
}

@end
