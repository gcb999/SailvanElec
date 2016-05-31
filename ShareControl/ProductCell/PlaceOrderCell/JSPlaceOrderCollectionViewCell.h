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

//1:背景图
@property(nonatomic ,strong)UIImageView *bgImgView;

//2:大图
@property(nonatomic ,strong)UIImageView *productImgView;


//3:左上角折扣/价格

@property(nonatomic,strong)UIImageView *product_Discount_ImgView;

@property(nonatomic,strong)UILabel *product_Discount_Lable;





//4: 标题
@property(nonatomic,strong)UILabel *product_Title_Lable;


//5: color,size ,type
@property(nonatomic,strong)UILabel *product_Color_Lable;

@property(nonatomic,strong)UILabel *product_Size_Lable;

@property(nonatomic,strong)UILabel *product_Type_Lable;


//6: 数量
@property(nonatomic,strong)UILabel *product_Quntity_Lable;




//7: 优惠价与原价

@property(nonatomic ,strong)UILabel *product_Price_Label;

@property(nonatomic ,strong)UILabel *product_DiscountPrice_Label;


//8：闪购时间和图片

@property(nonatomic,strong)UIImageView *product_flashGo_ImgView;
@property(nonatomic,strong)UILabel *product_flashGo_label;


//9:免邮

@property(nonatomic,strong)UIImageView *product_Free_Imgview;

//10:sold Out
@property(nonatomic,strong)UIImageView *product_SoldOutImgview;

//11： 线

@property(nonatomic,strong)UIImageView *lineImgView;

@end



