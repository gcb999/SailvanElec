//
//  HomeViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import "JSProductCollectionViewCell.h"
#import "HomeDetailVIewController.h"
#import "HYBMoveTransition.h"
#import "HYBModalTransition.h"
#import "JSProductCollectionViewCell.h"
#import "JSWaterFlowLayout.h"
#import "JSProductCollectionViewCellFrameModel.h"



@interface HomeViewController ()<JSCollectionViewControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate>
{
    
 JSCollectionViewController *ctrl;
}
@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic, strong) HYBMoveTransition *transition;
@property (nonatomic, strong) HYBModalTransition *modalTransition;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

   

 
    

   ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSProductCollectionViewCell class] delegate:self];
    ctrl.pagingEnabled=YES;
    
    ctrl.view.frame=self.view.bounds;
   
  
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
  
    JSWaterFlowLayout *flowout=[[JSWaterFlowLayout alloc] init];
    flowout.delegate=self;
    ctrl.flowLayout=flowout;
    [self.view addSubview:self.pageControl];

    



}



-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    
    
    HomeDetailVIewController *ctrl=[[HomeDetailVIewController alloc] init];
    NSString *url=JSCtrl.data[indexPath.row];
    ctrl.imageUrl=url;
        
//        self.navigationController.delegate=self.transition;
        [self.navigationController pushViewController:ctrl animated:YES];
        
     
   
    
   
    
}



#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [SWCtrl.data removeAllObjects];
    for (int i=0; i<20; i++) {
        JSProductCollectionViewCellFrameModel *frameModel=[[JSProductCollectionViewCellFrameModel alloc] initWithDic:@{}];
        [SWCtrl.data addObject:frameModel];
    }
    
    
    [SWCtrl reloadHeader];
    
    
    
}

#pragma mark -JSWaterFlowLayoutDelegate

//设置每个Item高度
- (CGFloat)waterflowLayout:(JSWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth{

    JSProductCollectionViewCellFrameModel *frameModel=ctrl.data[index];
    return frameModel.rowHeight;
    
}

//设置一行几列

- (CGFloat)columnCountInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout;{
    
    return 2;
    
}

#pragma mark-设置 section
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)columnMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout{
    return 2;
}

- (CGFloat)rowMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout{
    return 5;
}






@end
