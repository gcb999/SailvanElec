
//
//  HomeDetailVIewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/25.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeDetailVIewController.h"
#import "HYBMoveTransition.h"

@implementation HomeDetailVIewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(0,0, IPHONScreenWidth, 200);
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"move detail";
    [self.view addSubview:imgView];
    
    [self loadingBigPlaceholderImageName:self.imageUrl imgview:imgView];
    
    // You must specify a target view with this.
   self.hyb_toTargetView = imgView;
    

}

@end
