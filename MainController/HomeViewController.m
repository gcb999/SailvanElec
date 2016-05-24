//
//  HomeViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import "MainCollectionViewCell.h"
#import "LeftViewController.h"

@interface HomeViewController ()<JSCollectionViewControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate>
@property (nonatomic , strong) UIPageControl *pageControl;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

   

    
//    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[MainCollectionViewCell class] delegate:self];
//    
//    ctrl.pagingEnabled=YES;
//    
//    ctrl.collectionView.delegate = self;
//    
//    ctrl.view.frame=self.view.bounds;
//
//    
//    [self.view addSubview:ctrl.view];
//    [self addChildViewController:ctrl];
//    
//    
//        JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithContentFrame:self.view.bounds DirectionHorizontal:CGSizeMake(IPHONScreenWidth, 300) minimumLineSpacing:0];
//        ctrl.flowLayout=flowout;
//
//    [self.view addSubview:self.pageControl];
    
    CGRect hrect=CGRectMake(0, 0, IPHONScreenWidth, 300);
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[MainCollectionViewCell class] delegate:self];
    ctrl.pagingEnabled=YES;
    
    ctrl.view.frame=hrect;
   
  
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
  
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithContentFrame:hrect DirectionHorizontal:CGSizeMake(IPHONScreenWidth, 300) minimumLineSpacing:0];
    
    ctrl.flowLayout=flowout;
    [self.view addSubview:self.pageControl];

    

   
    
//    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithContentFrame:self.view.bounds DirectionHorizontal:CGSizeMake(IPHONScreenWidth, 300) minimumLineSpacing:0];
//    CGRect rect =self.view.bounds;
//    
//    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[MainCollectionViewCell class] delegate:self];
//    ctrl.pagingEnabled=YES;
//    ctrl.collectionView.delegate=self;
//    
//    ctrl.view.frame=rect;
//    ctrl.flowLayout=flowout;
//    
//    [self.view addSubview:ctrl.view];
//    
//    [self addChildViewController:ctrl];
//    
//      [self.view addSubview:self.pageControl];

    // Do any additional setup after loading the view.
}

//#pragma mark -实现网络请求数据
//
//-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
//    
//    [SWCtrl.data removeAllObjects];
//    NSArray *date=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
//    self.pageControl.numberOfPages = date.count;
//    [SWCtrl.data addObjectsFromArray:date];
//    [SWCtrl reloadHeader];
//    
//    
//}
//
//-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    LeftViewController *ctrl=[[LeftViewController alloc] init];
//    [self.navigationController pushViewController:ctrl animated:YES];
//}
//
//
////- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
////                                            animationControllerForOperation:(UINavigationControllerOperation)operation
////                                                         fromViewController:(UIViewController *)fromVC
////                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
////    
////    NSLog(@"---aaa");
////    return nil;
////    
////}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    self.pageControl.currentPage = scrollView.contentOffset.x / IPHONScreenWidth;
//}
//
//
//- (UIPageControl *)pageControl
//{
//    if (_pageControl == nil) {
//        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0,100, 50)];
//                _pageControl.backgroundColor = [UIColor purpleColor];
//        _pageControl.center=CGPointMake(100, 100);
//    }
//    return _pageControl;
//}

#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [SWCtrl.data removeAllObjects];
    NSArray *date=@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    self.pageControl.numberOfPages = date.count;
    [SWCtrl.data addObjectsFromArray:date];
    [SWCtrl reloadHeader];
    
    
    
}
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.bigImageView.index = indexPath.row;
//    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
//        self.bigImageView.frame = CGRectMake(0, 0, IPHONScreenWidth, IPHONScreenHeight);
//        
//    } completion:^(BOOL finished) {
//        
//    }];
    NSLog(@"----sss");
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / IPHONScreenWidth;
}


//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//
//    if ([NSStringFromClass([touch.view class]) isEqualToString:@"ItemImageViewCellContentView"]) {
//
//        return YES;
//
//    }
//
//    return NO;
//
//}


- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((IPHONScreenWidth - 100) / 2, 250, 100, 30)];
              _pageControl.backgroundColor = [UIColor purpleColor];
    }
    return _pageControl;
}


@end
