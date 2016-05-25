//
//  JSItemImageViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/25.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSItemImageViewController.h"
#import "MainCollectionViewCell.h"
#import "JSBigItemImageViewController.h"

@interface JSItemImageViewController ()<JSCollectionViewControllerDelegate>
{
    
}


@property (nonatomic , strong) JSBaseFlowLayout *baseFlowLayOut;

@end

@implementation JSItemImageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //1： add colleciontionView
    [self.view addSubview:self.collectionViewController.view];
    [self addChildViewController:self.collectionViewController];
    
    
    
    //2:  添加PageController
    [self.view addSubview:self.pageControl];
    
    
   
 
}

#pragma mark -加载数据源
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [self.collectionViewController.data addObjectsFromArray:self.smallImgUrl];
    self.pageControl.numberOfPages=self.smallImgUrl.count;
    [self.collectionViewController reloadHeader];
    
}

#pragma mark -点击事件

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSBigItemImageViewController *ctrl=[[JSBigItemImageViewController alloc] init];
    ctrl.bigImgUrl=self.bigImgUrl;
    [self.navigationController pushViewController:ctrl animated:YES];
}


#pragma mark -滚动事件 UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / IPHONScreenWidth;
}



#pragma mark -列表控件

-(JSCollectionViewController *)collectionViewController{
    if(_collectionViewController==nil){
     _collectionViewController =[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[MainCollectionViewCell class] delegate:self];
        _collectionViewController.pagingEnabled=YES;
        
    }
    
    return _collectionViewController;
}



#pragma mark -页码控件
- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectZero];
        
            }
    return _pageControl;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGRect rect =self.view.bounds;
    
    //1:设置CollectionView坐标
    self.collectionViewController.view.frame=rect;
    
    //2: 设置PageController坐标
    CGSize size=rect.size;
    CGFloat width=size.width*0.5f;
    CGFloat height=size.height-20;
    _pageControl.frame=CGRectMake(0, 0, size.width, 20);
    _pageControl.center=CGPointMake(width,height);
    
    //3： 添加流水布局
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithContentFrame:rect DirectionHorizontal:rect.size minimumLineSpacing:0];
    self.collectionViewController.flowLayout=flowout;

}


@end
