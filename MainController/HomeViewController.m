//
//  HomeViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import "JSProductViewCell.h"
#import "HomeDetailVIewController.h"
#import "HYBMoveTransition.h"
#import "HYBModalTransition.h"


@interface HomeViewController ()<JSCollectionViewControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate>
{
    
//    HYBMoveTransition *customPush;
}
@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic, strong) HYBMoveTransition *transition;
@property (nonatomic, strong) HYBModalTransition *modalTransition;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

   

 
    

    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSProductViewCell class] delegate:self];
    ctrl.pagingEnabled=YES;
    
    ctrl.view.frame=self.view.bounds;
   
  
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
  
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:200];
    
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
    NSArray *date=@[
                    @"",@"",@"",
                    @"",@"",@"",
                    @"",@"",@"",
                    @"",@"",@"",
                    @"",@"",@""
                    
                    ];
    self.pageControl.numberOfPages = date.count;
    [SWCtrl.data addObjectsFromArray:date];
    [SWCtrl reloadHeader];
    
    
    
}








@end
