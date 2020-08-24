//
//  LXPeripheralListView.m
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXPeripheralListView.h"
#import "LXPeripheralCollectionViewCell.h"
#import "LxPeripheral.h"
#import "LXDeviceModel.h"

#define collectinViewCellID @"LXPeripheralCollectionViewCell"

@interface LXPeripheralListView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation LXPeripheralListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
        [self createLayout];
        
    }
    return self;
}

- (void)createUI {
    
    [self addSubview:self.collectionView];
}

- (void)createLayout {
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
}

- (void)setPeripheralArray:(NSArray *)peripheralArray {
    
    _peripheralArray = peripheralArray;
    [self.collectionView reloadData];
}

#pragma mark - - - UICollectionView 的 dataSource、delegate方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.peripheralArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LXPeripheralCollectionViewCell * cell = (LXPeripheralCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectinViewCellID forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    LXPeripheral *peripheral = self.peripheralArray[row];
    cell.peripheral = peripheral;
    for (LXDeviceModel *dModel in self.deviceArray) {
        
        if ([dModel.deviceId isEqualToString:peripheral.mac]) {
            
            cell.name = dModel.name;
        }
    }
    return cell;
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);//分别为上、左、下、右
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    CBPeripheral *peripheral = self.peripheralArray[row];
    if ([self.delegate respondsToSelector:@selector(didItem:)]) {
        
        [self.delegate didItem:peripheral];
    }
}



//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    return CGSizeMake(KScreenWidth/2, 100);
//}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 20;
        flowLayout.minimumLineSpacing = 20;
        flowLayout.itemSize = CGSizeMake((KScreenWidth - 40)/2, 60);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[LXPeripheralCollectionViewCell class] forCellWithReuseIdentifier:collectinViewCellID];
    }
    
    return _collectionView;
}

@end
