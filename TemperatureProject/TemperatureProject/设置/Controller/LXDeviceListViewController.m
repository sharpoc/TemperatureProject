//
//  LXDeviceListViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDeviceListViewController.h"
#import "LXDeviceListViewModel.h"

@interface LXDeviceListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) LXDeviceListViewModel *viewModel;
@property (nonatomic,copy) NSArray *lists;
@end

@implementation LXDeviceListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.viewModel getDeviceListWithBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull model) {
        
        if (success) {
            
            self.lists = model;
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
    
//    SQPTSelectAddressListViewTableViewCell *cell = [SQPTSelectAddressListViewTableViewCell cellWithTableView:tableView];
    return nil;
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
