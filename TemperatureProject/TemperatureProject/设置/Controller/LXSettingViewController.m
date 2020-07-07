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

@interface LXSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation LXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = KSQRandomColor;
    [self createUI];
    [self createLayout];
}

- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)createUI {
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.tableView];
}

- (void)createLayout {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
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
        
        LXAddGroupViewController *addGroupVC = [[LXAddGroupViewController alloc] init];
        [self.navigationController pushViewController:addGroupVC animated:YES];
    }
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = KSQColor(49, 197, 159);
    }
    
    return _titleLabel;
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
