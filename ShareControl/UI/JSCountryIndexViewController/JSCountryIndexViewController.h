//
//  JSCountryIndexViewController.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSBasicViewController.h"
#import "MJNIndexView.h"
#import "JSTableGroupViewController.h"

@interface JSCountryIndexViewController : JSBasicViewController

//热门数据源
@property (nonatomic , strong)    JSTableGroupViewController *ctrl;

// MJNIndexView
@property (nonatomic, strong) MJNIndexView *indexView;//第三方索引


@end
