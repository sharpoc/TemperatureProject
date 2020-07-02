//
//  LXHistoryTemperatureViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/2.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXHistoryTemperatureViewController.h"
#import "LXHistoryTemperatureViewModel.h"
#import "LXHistoryTemperatureTableViewCell.h"
#import "LXHistoryTemperatureModel.h"

@interface LXHistoryTemperatureViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) LXHistoryTemperatureViewModel *viewModel;
@property (nonatomic,copy) NSArray *lists;

@end

@implementation LXHistoryTemperatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    [self createLayout];
    [self createData];
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.tableView];
}

- (void)createLayout {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(100);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(0);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];

}

- (void)createData {
    
    [self.viewModel getHistoryData:self.mac page:1 size:20 withBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull model) {
       
        self.lists = model;
        [self.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.lists.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 35;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LXHistoryTemperatureModel *model = self.lists[indexPath.row];
    LXHistoryTemperatureTableViewCell *cell = [LXHistoryTemperatureTableViewCell cellWithTableView:tableView];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"showdetail"];
        _bgImageView.userInteractionEnabled = YES;
    }
    
    return _bgImageView;
}

- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = KSQRandomColor;
    }
    
    return _bgView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"历史数据";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = KSQColor(230, 204, 255);
        _titleLabel.textColor = KSQColor(90, 90, 90);
    }
    
    return _titleLabel;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (LXHistoryTemperatureViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXHistoryTemperatureViewModel alloc] init];
    }
    
    return _viewModel;
}




@end
