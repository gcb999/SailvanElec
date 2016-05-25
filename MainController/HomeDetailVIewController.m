
//
//  HomeDetailVIewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/25.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeDetailVIewController.h"
#import "HYBMoveTransition.h"
#import "JSItemImageViewController.h"

@implementation HomeDetailVIewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *imgView = [[UIImageView alloc] init];
//    imgView.frame = CGRectMake(0,0, IPHONScreenWidth, 200);
//    
//    self.title = @"move detail";
//    [self.view addSubview:imgView];
//    
//    [self loadingBigPlaceholderImageName:self.imageUrl imgview:imgView];
//    
////     You must specify a target view with this.
//   self.hyb_toTargetView = imgView;
    [self test];
    

}

-(void)test{
    
    JSItemImageViewController *ctrl=[[JSItemImageViewController alloc] init];
    ctrl.smallImgUrl=@[
                       @"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg",
                       
                       @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg" ,
                       @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg"
                       
                       ];
    ctrl.bigImgUrl=@[
                       @"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg",
                       
                       @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg" ,
                       @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg"
                       
                       ];
    ctrl.view.frame=CGRectMake(0, 0, IPHONScreenWidth, 200);
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

@end
