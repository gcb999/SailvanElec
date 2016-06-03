//
//  Header.h
//  ProgramDemo
//
//  Created by zy on 13-11-18.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#ifndef ProgramDemo_Header_h
#define ProgramDemo_Header_h








#define PAYPALENVIRON_TYPE 0

#if PAYPALENVIRON_TYPE ==0

#define PAYPALENVIRONMENT PayPalEnvironmentSandbox//测试

#elif PAYPALENVIRON_TYPE==1

#define PAYPALENVIRONMENT PayPalEnvironmentProduction//正式

#else

#define PAYPALENVIRONMENT PayPalEnvironmentNoNetwork//无网

#endif



#import "JSPayPal.h"
#import "JSBraintree.h"



#import <UIKit/UIKit.h>


#define DLURL @""


//宏头文件

#import "MacroHeader.h"


//侧滑框架

#import "JASidePanelController.h"

//集成3DTouch
#import "AppDelegate+ThridDTouch.h"


#pragma mark -----------第三方头文件------------


//AFN
#import "AFHTTPRequestOperationManager.h"


//图片
#import "UIImageView+WebCache.h"


//md5 编码
#import "JSMD5.h"


//导航手势
#import "UINavigationController+FDFullscreenPopGesture.h"

//mj 上拉
#import "MJRefresh.h"

//MJ 模型编码
#import "MJExtension.h"



#pragma mark -----------基本控件头文件------------

#import "NSObject+UICateGory.h"
#import "NSObject+Utilty.h"
#import "NSDictionary+Extension.h"


#import "NSObject+SDWebImage.h"

#import "NSMutableAttributedString+CBAttributedString.h"




//父控制
#import "JSBasicViewController.h"
#import "JSBasicViewController+ThreeDTouch.h"

#import "UIViewController+NavigationItem.h"

//导航控制器
#import "JSNavigationController.h"



#pragma mark -----------自定义TableView和CollectionView头文件--------------------



//TableView头文件

#import "JSTableViewController.h"

#import "JSTableViewController+MJRefresh.h"//集成MJ

#import "JSTableViewController+TableView.h"//集成tableview代理方法

#import "JSTableViewCellDelegate.h"//集成cell代理

#import "JSTableViewController+NotWorkView.h"//集成无网view

#import "JSTableViewController+TableHeaderFooter.h"//头部底部

#import "JSTableViewController+StretchableTableHeaderView.h"//头部放大

#import "JSTableViewController+ThreeDTouch.h"////3DTouch





//Collection头文件

#import "JSCollectionViewController.h"
#import "JSCollectionViewController+MJRefresh.h"
#import "JSCollectionViewController+NotWorkView.h"
#import "JSCollectionViewController+CollectionView.h"

#import "JSCollectionViewDelegate.h"//代理方法

#import "JSCollectionViewController+ThreeDTouch.h"//3DTouch



//流水瀑布
#import "JSBaseFlowLayout.h"
#import "JSLineLayout.h"





#pragma mark -----------自定义网路头文件--------------------


//网络
#import "JSNetWork.h"
#import "JSNetWork+GET.h"
#import "JSNetWork+POST.h"
#import "JSError.h"



//MB
#import "MBProgressHUD+Add.h"



//JSON

//#import "JSON.h"



//实体
#import "JSUserSingletonModel.h"


#pragma mark -----------PickerView--------------------

#import "JSPresentView.h"
#import "JSPresentCommonViewCtrl.h"

#import "JSDIYButton.h"



#pragma mark -----------自定义商品Cell--------------------

#import "JSBaseProductCollectionCellModel.h"//实体类

#import "JSBaseProductCollectionCellFrameModel.h"//实体布局类

#import "JSBaseProductCollectionCellFrameModel+Layout.h"//实体布局扩展类

#import "JSBaseProductCollectionCell.h"//商品类

/*

一：JSBaseProductCollectionCell用法
 
A: 先继承 JSBaseProductCollectionCell
 
B： 调用[super JSCollectionViewController:JSCtrl collectionViewDateArr:dateArr cellValue:date indexPath:indexpath];

 
二：JSBaseProductCollectionCellFrameModel
 
 
A: 重写Cell的高度
 -(void)layoutRowHeight:(JSBaseProductCollectionCellModel *)frameModel;
 
B: 重新算Cell坐标
 -(void)layoutSubFrame:(CGRect)rect ;
 
 
 */



#endif

