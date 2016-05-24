//
//  JSCollectionViewController.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionView+CYLTableViewPlaceHolder.h"

@protocol JSCollectionViewControllerDelegate;
@protocol JSCollectionViewCellDelegate;
@protocol JSCollectionViewHeaderFooterDelegate;

typedef enum {
    /** 普通列表 */
   JSCollectionViewNormal = 1,
    /** 只显示上拉 */
    JSCollectionViewPullHeader=2,
    /** 只显示下拉 */
    JSCollectionViewPullFooter=3,
     /** 只显示上拉和下拉*/
    JSCollectionViewPullHeaderFooter=4
} JSCollectionViewState;


//cell
static NSString *const JSCollectionViewCellIdentifier = @"JSCollectionViewCellIdentifier";

//header
static NSString *const JSCollectionHeaderIdentifier = @"JSCollectionHeaderIdentifier";

//footer
static NSString *const JSCollectionFooterIdentifier = @"JSCollectionFooterIdentifier";


/*
 CollectionView 集成功能（暂时不考虑分组）

①： 集成自定义tableViewHeader 和 tableViewFooter ()

②： 集成自定义Cell，并且赋值即可 （协议） (v)

③： 集成MJ(v)

④： 集成空View (v)

⑤： 集成上拉弹簧 ()

*/


@interface JSCollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>


//cell 类
@property(nonatomic,readonly)Class collectionCellClass;

// header 类
@property(nonatomic,readonly)Class headerViewClass;

// footer 类
@property(nonatomic,readonly)Class footerViewClass;


#pragma mark - 是否每次进入页面加载一次网络请求
@property(nonatomic,assign)BOOL IsEveryLoading;// 是否只加载一次;



@property(nonatomic,strong)UICollectionView * collectionView;


@property(nonatomic,assign)NSInteger pageIndex;//页码

@property(nonatomic,assign)BOOL pagingEnabled;


#pragma mark - 代理方法
@property(nonatomic,weak)id<JSCollectionViewControllerDelegate> delegate;

@property(nonatomic,strong)NSMutableArray *data;//数据源

@property(nonatomic,weak)id<JSCollectionViewCellDelegate> CollectionViewCellDelegate;//cell 代理


@property(nonatomic,weak)id<JSCollectionViewHeaderFooterDelegate> HeaderFooterCollectionViewDelegate;//头部与底部代理方法



//正常
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate;


//头部
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  HeaderViewType:(Class) headerViewClass;

//底部
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  footerViewClass:(Class) footerViewClass;


//头部与底部
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  HeaderViewType:(Class) headerViewClass  footerViewClass:(Class) footerViewClass;


#pragma mark - 设置UICollection 流水布局  系统自带默认系统流水布局 UICollectionViewFlowLayout

@property(nonatomic,strong)UICollectionViewLayout *flowLayout;

#pragma mark -注册3DTouch 功能

@property(nonatomic,assign)BOOL isEnable3DTouch;




@end




@protocol JSCollectionViewControllerDelegate <NSObject>

// 网络加载
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage;


//点击事件
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

//高度
-(CGSize)JSCollectionViewController:(JSCollectionViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath;



//头部大小
-(CGSize)JSCollectionViewController:(JSCollectionViewController *)JSCtrl layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

//底部大小
-(CGSize)JSCollectionViewController:(JSCollectionViewController *)JSCtrl layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

//3dTouch

#pragma mark --------3DTouch-----------------

//Peek

-(UIViewController *)JSCollectionViewController:(JSCollectionViewController *)JSCtrl  previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location;

//POP
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl  popViewController:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit;



@end