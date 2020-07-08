//
//  LXDeviceListViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDeviceListViewController.h"
#import "LXDeviceListViewModel.h"
#import "LXDeviceListTableViewCell.h"
#import "LXDeviceModel.h"
#import "LXSetAlarmViewController.h"
#import "LXHistoryTemperatureViewController.h"

@interface LXDeviceListViewController ()<UITableViewDataSource,UITableViewDelegate,LXDeviceListTableViewCellDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) LXDeviceListViewModel *viewModel;
@property (nonatomic,copy) NSArray *lists;
@end

@implementation LXDeviceListViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    
    [self createUI];
    [self createLayout];
    [self createData];

}

- (void)createUI {
    
    [self.view addSubview:self.tableView];
}

- (void)createLayout {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.navView.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)createData {
    
    [self.viewModel getDeviceListWithBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull model) {
        
        if (success) {
            
            self.lists = model;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark LXDeviceListTableViewCellDelegate

- (void)controlClick:(LXDeviceModel *)model {
    
    LXSetAlarmViewController *alarmVc = [[LXSetAlarmViewController alloc] init];
    [self.navigationController pushViewController:alarmVc animated:YES];
}

- (void)infoClick:(LXDeviceModel *)model {
    
    LXHistoryTemperatureViewController *historyVC = [[LXHistoryTemperatureViewController alloc] init];
    historyVC.mac = model.deviceId;
    [self.navigationController pushViewController:historyVC animated:YES];
}

- (void)delClick:(LXDeviceModel *)model {
    
    [self.viewModel delDeviceWithMac:model andBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull model) {
       
        if (success) {
            
            [LXTostHUD showTitle:msg];
            [self createData];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LXDeviceModel *model = self.lists[indexPath.row];
    LXDeviceListTableViewCell *cell = [LXDeviceListTableViewCell cellWithTableView:tableView];
    cell.delegate = self;
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}

- (LXDeviceListViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXDeviceListViewModel alloc] init];
    }
    
    return _viewModel;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

@end
