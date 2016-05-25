//
//  SWTableViewController.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSListViewEmptyView.h"
#import "JSStretchableTableHeaderView.h"


@protocol JSTableViewControllerDelegate;
@protocol JSTableViewCellDelegate;
@protocol JSTableScrollViewDelegate;


typedef enum {
    /** 普通列表 */
    JSTableViewNormal = 1,
    /** 显示上拉 */
    JSTableViewPullHeader=2,
    /** 显示下拉 */
    JSTableViewPullFooter=3,
    /** 显示上下拉 */
    JSTableViewPullHeaderFooter=4
} JSTableViewState;

static NSString *const KSWIdentifier=@"JSTableViewController";


/*

tableview 集成功能（暂时不考虑分组）

①： 集成自定义tableViewHeader 和 tableViewFooter (v)

②： 集成自定义Cell，并且赋值即可 （协议） (v)

③： 集成MJ(v)

④： 集成空View (v)

⑤： 集成上拉弹簧 (v)

 */

@interface JSTableViewController : UITableViewController<UIViewControllerPreviewingDelegate>



@property(nonatomic,assign)NSInteger pageIndex;//页码

@property(nonatomic,weak)id<JSTableViewControllerDelegate,JSTableScrollViewDelegate> delegate;//代理

@property(nonatomic,strong)NSMutableArray *data;//数据源


@property(nonatomic,weak)id<JSTableViewCellDelegate> JSTableViewCellDelegate;//cell代理方法


#pragma mark - 是否每次进入页面加载一次网络请求
@property(nonatomic,assign)BOOL IsEveryLoading;// 是否只加载一次;



#pragma mark - 头部是否拉伸 HFStretchableTableHeaderView
@property(nonatomic,strong) JSStretchableTableHeaderView *stretchHeaderView;



//初始化方法
- (instancetype)initWithState:(JSTableViewState)state tableViewCellClass:(Class) cellclass delegate:(id<JSTableViewControllerDelegate>)delegate;

#pragma mark -注册3DTouch 功能

@property(nonatomic,assign)BOOL isEnable3DTouch;


@end




@protocol JSTableViewControllerDelegate <JSTableScrollViewDelegate>


// 网络加载
-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage;

//点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


//高度
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath;


#pragma mark --------直接加头部和底部View-----------------

-(UIView *)JSTableViewControllerWithViewForTableFooterView ;
-(UIView *)JSTableViewControllerWithViewForTableHeaderView;



#pragma mark -------分组头部-----------

-(UIView *)JSTableViewController:(JSTableViewController *)JSCtrl viewForHeaderInSection:(NSInteger)section;

-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl  heightForHeaderInSection:(NSInteger)section;


#pragma mark -------分组底部-----------
-(UIView *)JSTableViewController:(JSTableViewController *)JSCtrl viewForFooterInSection:(NSInteger)section;
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl  heightForFooterInSection:(NSInteger)section;


#pragma mark --------3DTouch-----------------

//Peek

-(UIViewController *)JSTableViewController:(JSTableViewController *)JSCtrl  previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location;

//POP
-(void)JSTableViewController:(JSTableViewController *)JSCtrl  popViewController:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit;

@end



@protocol JSTableScrollViewDelegate <NSObject>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2); // any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;   // called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;      // called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView; // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;     // return a view that will be scaled. if delegate returns nil, nothing happens
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2); // called before the scroll view begins zooming its content
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale; // scale between minimum and maximum. called after any 'bounce' animations

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;   // return a yes if you want to scroll to the top. if not defined, assumes YES
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;      // called when scrolling animation finished. may be called immediately if already at top




@end




