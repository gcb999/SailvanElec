//
//  HomeViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import "MainCollectionViewCell.h"
#import "HomeDetailVIewController.h"
#import "HYBMoveTransition.h"

@interface HomeViewController ()<JSCollectionViewControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate>
{
    
//    HYBMoveTransition *customPush;
}
@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic, strong) HYBMoveTransition *transition;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

   

 
    
    CGRect hrect=CGRectMake(0, 0, IPHONScreenWidth, 300);
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[MainCollectionViewCell class] delegate:self];
    ctrl.pagingEnabled=YES;
    
    ctrl.view.frame=hrect;
   
  
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
  
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:80];
    
    ctrl.flowLayout=flowout;
    [self.view addSubview:self.pageControl];

    



}



-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeDetailVIewController *ctrl=[[HomeDetailVIewController alloc] init];
    

    
   self.transition=[[HYBMoveTransition alloc] initWithPushed:^(UIViewController *fromVC, UIViewController *toVC, HYBBaseTransition *transition) {
       HYBMoveTransition *move = (HYBMoveTransition *)transition;
       MainCollectionViewCell *cell = (MainCollectionViewCell *)[JSCtrl.collectionView cellForItemAtIndexPath:indexPath];
       move.targetClickedView = cell.aimgview;
       move.animatedWithSpring = YES;
 
   } poped:^(UIViewController *fromVC, UIViewController *toVC, HYBBaseTransition *transition) {
       
       toVC.navigationController.delegate = nil;
   
   }];
    ctrl.imageUrl=JSCtrl.data[indexPath.row];
    
    self.navigationController.delegate=self.transition;
    [self.navigationController pushViewController:ctrl animated:YES];
    
}



#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [SWCtrl.data removeAllObjects];
    NSArray *date=@[@"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg",
                    
                    @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg",
                    @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg"
                    ];
    self.pageControl.numberOfPages = date.count;
    [SWCtrl.data addObjectsFromArray:date];
    [SWCtrl reloadHeader];
    
    
    
}








@end
