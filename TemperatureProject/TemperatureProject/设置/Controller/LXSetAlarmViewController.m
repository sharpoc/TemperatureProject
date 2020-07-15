//
//  LXSetAlarmViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/16.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXSetAlarmViewController.h"

@interface LXSetAlarmViewController ()<UIPickerViewDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,copy) NSArray *firstNumArray;
@property (nonatomic,copy) NSArray *secondNumArray;
@property (nonatomic,assign) NSInteger firstRow;
@property (nonatomic,assign) NSInteger secondRow;
@property (nonatomic,copy) NSString *firstValue;
@property (nonatomic,copy) NSString *secondValue;


@property (nonatomic,strong) UIButton *okButton;
@property (nonatomic,strong) UILabel *dianLabel;
@property (nonatomic,strong) UILabel *duLabel;//度Label

@end

@implementation LXSetAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    [self createLayout];
    
    self.firstNumArray = @[@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40"];
    self.secondNumArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.pickerView];
    [self.bgView addSubview:self.okButton];
    [self.pickerView addSubview:self.dianLabel];
    [self.pickerView addSubview:self.duLabel];
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
        make.bottom.mas_equalTo(-20);
        make.top.mas_equalTo(kNavigationBarHeight + 20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(50);
    }];
    
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        make.bottom.mas_equalTo(self.okButton.mas_top).offset(0);
    }];
    
    [self.okButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
        make.bottom.mas_equalTo(self.bgView.mas_bottom).offset(-30);
    }];
    
    [self.dianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.width.mas_equalTo(6);
        make.height.mas_equalTo(6);
        make.centerX.mas_equalTo(self.pickerView.mas_centerX).offset(-12);
        make.centerY.mas_equalTo(self.pickerView.mas_centerY).offset(6);
    }];
    
    [self.duLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
        make.centerX.mas_equalTo(self.pickerView.mas_centerX).offset(35);
        make.centerY.mas_equalTo(self.pickerView.mas_centerY).offset(-6);
    }];
    
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

- (void)okButtonClick {
    
    NSString *wendu = [NSString stringWithFormat:@"%@.%@",self.firstValue,self.secondValue];
    [[LXCacheManager shareInstance] setObjectWithUserDefaultKey:@"wendu" withObject:wendu];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UIPickerViewDelegate
//数据源方法，返回需要显示的数据一共有几列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

//数据源方法，返回某一列对应的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
      //当为第一列时，返回provinces数组的个数，即为省的行数
        return self.firstNumArray.count;
    } else {
        return self.secondNumArray.count;
    }
}

// 自定义 pickerView 的 label
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    //label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:28];

    if (component == 0) {
      //如果是第一列，直接返回对应行号索引的省的名称
        
        label.text = [NSString stringWithFormat:@"        %@",self.firstNumArray[row]];
        if (self.firstRow == row) {
            label.textColor = KSQColor(98, 216, 193);
        } else {
            
            label.textColor = KSQColor(151, 151, 151);
        }
    } else {
        
        label.textAlignment = NSTextAlignmentLeft;
        
        label.text = [NSString stringWithFormat:@"%@ ",self.secondNumArray[row]];

        if (self.secondRow == row) {
            label.textColor = KSQColor(98, 216, 193);;
        } else {
            label.textColor = KSQColor(151, 151, 151);
        }
    }
    

    return label;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return 60;
}

//选中了pickerView的第component列第row行

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        
        self.firstValue = self.firstNumArray[row];
        self.firstRow = row;
    } else {
        
        self.secondValue = self.secondNumArray[row];
        self.secondRow = row;
    }
    
    
    [self.pickerView reloadAllComponents];
}

- (UILabel *)duLabel {
    
    if (!_duLabel) {
        
        _duLabel = [[UILabel alloc] init];
        _duLabel.text = @"°C";
        _duLabel.textColor = KSQColor(98, 216, 193);
        _duLabel.font = [UIFont systemFontOfSize:18];
    }
    
    return _duLabel;
}

- (UILabel *)dianLabel {
    
    if (!_dianLabel) {
        
        _dianLabel = [[UILabel alloc] init];
        _dianLabel.backgroundColor = KSQColor(97, 216, 193);
        _dianLabel.layer.cornerRadius = 3;
        _dianLabel.layer.masksToBounds = YES;
    }
    
    return _dianLabel;
}



- (UIButton *)okButton {
    
    if (!_okButton) {
        
        _okButton = [[UIButton alloc] init];
        [_okButton setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        [_okButton setTitle:@"确定" forState:UIControlStateNormal];
        [_okButton addTarget:self action:@selector(okButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _okButton;
}



- (UIPickerView *)pickerView {
    
    if (!_pickerView) {
        
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate = self;
    }
    
    return _pickerView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = KSQColor(97, 216, 193);
        _titleLabel.text = @"高温报警设置";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 10;
    }
    
    return _bgView;
}

- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"setalarmbg"];
    }
    
    return _bgImageView;
}

@end
