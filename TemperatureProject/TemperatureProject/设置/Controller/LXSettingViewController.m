//
//  LXSettingViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXSettingViewController.h"
#import "LXSettingItemModel.h"
#import "LXSettingItemTableViewCell.h"
#import "LXUpdateUserNameViewController.h"
#import "LXFindPwdViewController.h"
#import "LXAddGroupViewController.h"
#import "LXDeviceListViewController.h"
#import "LXSetAlarmViewController.h"
#import "LXGroupListViewController.h"

@interface LXSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation LXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    [self createLayout];
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

- (void)setLists:(NSArray<LXSettingItemModel *> *)lists {
    
    _lists = lists;
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LXSettingItemModel *model = self.lists[indexPath.row];
    LXSettingItemTableViewCell *cell = [LXSettingItemTableViewCell cellWithTableView:tableView];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LXSettingItemModel *model = self.lists[indexPath.row];
    if (model.itemType == SQSettingItemTypeAdmin) {//用户设置
        
        LXSettingItemModel *adminManagerModel = [[LXSettingItemModel alloc] init];
        adminManagerModel.iconText = @"loginPhone";
        adminManagerModel.titleText = @"用户名";
        adminManagerModel.itemType = SQSettingItemTypeUserName;
        
        LXSettingItemModel *helpModel = [[LXSettingItemModel alloc] init];
        helpModel.iconText = @"loginPwd";
        helpModel.titleText = @"重设密码";
        helpModel.itemType = SQSettingItemTypePassWrod;
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:adminManagerModel];
        [array addObject:helpModel];
        
        LXSettingViewController *settingVC = [[LXSettingViewController alloc] init];
        settingVC.lists = array;
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    else if (model.itemType == SQSettingItemTypeUserName) {//修改用户名
        
        LXUpdateUserNameViewController *updateUserNameVC = [[LXUpdateUserNameViewController alloc] init];
        [self.navigationController pushViewController:updateUserNameVC animated:YES];
        
    } else if (model.itemType == SQSettingItemTypePassWrod) {//修改密码
        
        LXFindPwdViewController *findPwdVC = [[LXFindPwdViewController alloc] init];
        [self.navigationController pushViewController:findPwdVC animated:YES];
    } else if (model.itemType == SQSettingItemTypeGroupAdmin) {//添加群组
        
//        LXAddGroupViewController *addGroupVC = [[LXAddGroupViewController alloc] init];
//        [self.navigationController pushViewController:addGroupVC animated:YES];
        LXGroupListViewController *groupListVC = [[LXGroupListViewController alloc] init];
        [self.navigationController pushViewController:groupListVC animated:YES];
    } else if (model.itemType == SQSettingItemTypeDeviceAdmin) { //设备管理
        
        LXDeviceListViewController *deviceVC = [[LXDeviceListViewController alloc] init];
        [self.navigationController pushViewController:deviceVC animated:YES];
    } else if (model.itemType == SQSettingItemTypePoliceAdmin) {//温度管理
        
        LXSetAlarmViewController *alarmVc = [[LXSetAlarmViewController alloc] init];
        [self.navigationController pushViewController:alarmVc animated:YES];
    }
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//推荐该方法
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

@end
