//
//  JSPlaceOrderCollectionViewCell.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSPlaceOrderCollectionViewCellFrameModel.h"



@interface JSPlaceOrderCollectionViewCell : UICollectionViewCell<JSCollectionViewCellDelegate>

#pragma mark - 0:背景图
@property(nonatomic ,strong)UIImageView *bgImgView;

#pragma mark - 1:商品图片
@property(nonatomic ,strong)UIImageView *productImgView;


#pragma mark -2:左上角折扣/价格
@property(nonatomic,strong)UIImageView *product_Discount_ImgView;
@property(nonatomic,strong)UILabel *product_Discount_Lable;


#pragma mark - 3: 标题
@property(nonatomic,strong)UILabel *product_Title_Lable;


#pragma mark - 4: color,size ,type
@property(nonatomic,strong)UILabel *product_Color_Lable;
@property(nonatomic,strong)UILabel *product_Size_Lable;
@property(nonatomic,strong)UILabel *product_Type_Lable;


#pragma mark -5: 数量
@property(nonatomic,strong)UILabel *product_Quntity_Lable;


#pragma mark - 6: 优惠价与原价
@property(nonatomic ,strong)UILabel *product_Price_Label;
@property(nonatomic ,strong)UILabel *product_DiscountPrice_Label;


#pragma mark -7：闪购时间和图片
@property(nonatomic,strong)UIImageView *product_flashGo_ImgView;
@property(nonatomic,strong)UILabel *product_flashGo_label;


#pragma mark -8:免邮
@property(nonatomic,strong)UIImageView *product_Free_Imgview;

#pragma mark -9:sold Out
@property(nonatomic,strong)UIImageView *product_SoldOutImgview;


#pragma mark -10： 线
@property(nonatomic,strong)UIImageView *lineImgView;

@end



