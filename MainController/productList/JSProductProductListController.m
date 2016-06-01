//
//  JSProductProductListController.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductProductListController.h"
#import "JSProductListCollectionViewCell.h"
#import "JSWaterFlowLayout.h"

@interface JSProductProductListController()<JSWaterFlowLayoutDelegate,JSCollectionViewControllerDelegate>{
    
    JSCollectionViewController *ctrl;
}

@end

@implementation JSProductProductListController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    
    ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSProductListCollectionViewCell class] delegate:self];
    ctrl.pagingEnabled=YES;
    
    ctrl.view.frame=self.view.bounds;
    
    
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
    JSWaterFlowLayout *flowout=[[JSWaterFlowLayout alloc] init];
    flowout.delegate=self;
    ctrl.flowLayout=flowout;
    
    
    
    
}


#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    for (int i=0; i<20; i++) {
        JSProductListCollectionViewCellFrameModel *frameModel=[[JSProductListCollectionViewCellFrameModel alloc] initWithDic:@{}];
        [SWCtrl.data addObject:frameModel];
    }
    
    
    [SWCtrl reloadHeader];
    
}








#pragma mark -JSWaterFlowLayoutDelegate

//设置每个Item高度
- (CGFloat)waterflowLayout:(JSWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth{
    
    JSProductListCollectionViewCellFrameModel *frameModel= ctrl.data[index];
    return frameModel.rowHeight;
    
}

//设置一行几列

- (CGFloat)columnCountInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout;{
    
    return 1;
    
}

#pragma mark-设置 section
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout{
    return UIEdgeInsetsMake(0, 5, 0, 0);
}

#pragma mark -列
- (CGFloat)columnMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout{
    return 2;
}

#pragma mark -行
- (CGFloat)rowMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout{
    return 3;
}
@end