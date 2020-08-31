//
//  LXGroupListViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/8/31.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXGroupListViewController.h"
#import "LXGroupListViewModel.h"
#import "LXGroupItemTableViewCell.h"
#import "LXGroupItemModel.h"

@interface LXGroupListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *groupListTableView;
@property (nonatomic,strong) LXGroupListViewModel *viewModel;
@property (nonatomic,copy) NSArray *lists;
@end

@implementation LXGroupListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = KSQColor(70, 182, 151);
    [self createUI];
    [self createLayout];
    [self createData];
}

- (void)createUI {
    
    [self.view addSubview:self.groupListTableView];
}

- (void)createLayout {
    
    [self.groupListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.navView.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)createData {
    
    [self.viewModel getGroupListWithBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull list) {
        
        if (success) {
            
            self.lists = list;
            [self.groupListTableView reloadData];
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
    
    LXGroupItemModel *model = self.lists[indexPath.row];
    LXGroupItemTableViewCell *cell = [LXGroupItemTableViewCell cellWithTableView:tableView];
    cell.model = model;
    cell.clickBlock = ^(LXGroupItemModel * _Nonnull model) {
        
        [self.viewModel outGroupWithCode:model.code andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
           
            if (success) {
                
                [self.groupListTableView reloadData];
            }
        }];
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (UITableView *)groupListTableView {
    
    if (!_groupListTableView) {
        
        _groupListTableView = [[UITableView alloc] init];
        _groupListTableView.delegate = self;
        _groupListTableView.dataSource = self;
    }
    
    return _groupListTableView;
}

- (LXGroupListViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXGroupListViewModel alloc] init];
    }
    
    return _viewModel;
}


@end
