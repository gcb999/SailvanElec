//
//  MainViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"
#import "JSNinaPagerViewConfig.h"

@interface MainViewController ()<JSCollectionViewControllerDelegate>
{
    JSNinaPagerViewConfig *config;
}
@end

@implementation MainViewController



#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [SWCtrl.data removeAllObjects];
    NSArray *date=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    [SWCtrl.data addObjectsFromArray:date];
    [SWCtrl reloadHeader];
    
    
}


#pragma mark -标题集合

-(NSArray *)titles{
    
    NSArray *titleArray =   @[
                              @"商品",
                              @"商品列表",
                              @"PL"
                              ];
    
    
    
    
    return titleArray;
}


#pragma mark -代码控制器集合

-(NSArray *)Controllers{
    
    NSArray *vcsArray = @[
                          @"HomeViewController",
                          @"JSProductProductListController",
                          @"PlaceOrderViewController"
                     
                          ];
    
    return vcsArray;
    
}


-(void)request{
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    config=[[JSNinaPagerViewConfig alloc] initWithFrame:self.view.bounds titles:[self titles] vcs:[self Controllers] delegate:self];
    [config loadingConfig];
    [self.view addSubview:config];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=KCOLOR_WHITE;
    self.title = @"Center Panel";
//    [self addBackBtn];
        [self request];
   
    
    
}

-(BOOL)deallocVCsIfUnnecessary{
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [config selectedIndex:1];
    
}




@end
