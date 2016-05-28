
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
    
    [self test];
    

}

-(void)test{
    
    NSArray *smallArr=@[
                        @"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg",
                        
                        @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg" ,
                        @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg"
                        
                        ];
    
    NSArray *bigArr=@[
                       @"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg",
                       
                       @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg" ,
                       @"http://pic28.nipic.com/20130411/2786001_094647503000_2.jpg"
                       
                       ];
    
    CGRect hrect=CGRectMake(0, 0, IPHONScreenWidth, 200);
    JSItemImageViewController *ctrl=[[JSItemImageViewController alloc] initWithFrame:hrect smallImgUrl:smallArr bigImgUrl:bigArr];
   
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

@end
