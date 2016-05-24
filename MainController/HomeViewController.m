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

@interface HomeViewController ()<JSCollectionViewControllerDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:120];
    CGRect rect =self.view.bounds;
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[MainCollectionViewCell class] delegate:self];
    
    ctrl.view.frame=rect;
    ctrl.flowLayout=flowout;
    
    [self.view addSubview:ctrl.view];
    
    [self addChildViewController:ctrl];
    // Do any additional setup after loading the view.
}

#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [SWCtrl.data removeAllObjects];
    NSArray *date=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    [SWCtrl.data addObjectsFromArray:date];
    [SWCtrl reloadHeader];
    
    
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftViewController *ctrl=[[LeftViewController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
}


@end
