//
//  JSProductCollectionViewCellFrameModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSProductCollectionViewCellModel.h"

@interface JSProductCollectionViewCellFrameModel : NSObject


//1: 背景图片坐标
@property(nonatomic ,assign,readonly) CGRect bgImgView_Frame;

//2:大图坐标
@property(nonatomic ,assign,readonly) CGRect product_Url_Frame;


//2:左上角折扣/价格坐标
@property(nonatomic ,assign,readonly) CGRect product_Discount_ImgView_Frame;

@property(nonatomic ,assign,readonly) CGRect product_Discount_Label_Frame;


//3: 标题坐标
@property(nonatomic ,assign,readonly) CGRect product_Title_Frame;





//5: 优惠价与原价坐标

@property(nonatomic ,assign,readonly) CGRect product_Price_Frame;

@property(nonatomic ,assign,readonly) CGRect product_DiscountPrice_Frame;



//6:闪购

@property(nonatomic ,assign,readonly) CGRect product_flashGo_ImgView_Frame;

@property(nonatomic ,assign,readonly) CGRect product_flashGo_Lable_Frame;


//7:免邮
@property(nonatomic,assign,readonly)CGRect product_freeshipping_Frame;//商品是否免邮

//8：卖光

@property(nonatomic ,assign,readonly) CGRect product_SoldOut_Frame;




//10; 行高
@property(nonatomic,assign,readonly)CGFloat rowHeight;


@property(nonatomic,strong)JSProductCollectionViewCellModel *model;


-(JSProductCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic;


-(void)layoutSubviews:(CGRect)rect;


@end
