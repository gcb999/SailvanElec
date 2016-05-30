
//
//  PlaceOrderViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "PlaceOrderViewController.h"
#import "JSPlaceOrderTableViewCell.h"

@implementation PlaceOrderViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self addBackBtn];
    CGRect  rect =self.view.bounds;
    
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewNormal tableViewCellClass:[JSPlaceOrderTableViewCell class] delegate:self];
    ctrl.view.frame=rect;
    
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
    
}


-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    for (int i=0; i<10; i++) {
        JSPlaceOrderTableViewCellFrameModel *frameModel=[[JSPlaceOrderTableViewCellFrameModel alloc] initWithDic:@{}];
        [JSCtrl.data addObject:frameModel];
    }


    [JSCtrl reloadHeader];
    
}




-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JSPlaceOrderTableViewCellFrameModel *frameModel= JSCtrl.data[indexPath.row];
    return frameModel.rowHeight;
}


@end
