//
//  JSProductViewCell.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSProductCollectionViewCellFrameModel.h"

@interface JSProductCollectionViewCell : UICollectionViewCell<JSCollectionViewCellDelegate>


#pragma mark -0:背景图
@property(nonatomic ,strong)UIImageView *bgImgView;

#pragma mark -1：闪购时间
@property(nonatomic,strong)UILabel *product_flashGo_label;

#pragma mark - 2:商品图
@property(nonatomic ,strong)UIImageView *productImgView;


#pragma mark - 3: SOLD OUT
@property(nonatomic,strong)UIImageView *product_SoldOut_ImgView;


#pragma mark - 4:左上角折扣/价格
@property(nonatomic,strong)UIImageView *product_Discount_ImgView;
@property(nonatomic,strong)UILabel *product_Discount_Lable;


#pragma mark - 5: 标题
@property(nonatomic,strong)UILabel *product_Title_Lable;


#pragma mark - 6: 优惠价与原价
@property(nonatomic ,strong)UILabel *product_Price_Label;
@property(nonatomic ,strong)UILabel *product_DiscountPrice_Label;


#pragma mark - 7: Edit和Buy

@property(nonatomic,strong)JSDIYButton *editBtn;
@property(nonatomic,strong)JSDIYButton *buyBtn;




@end
