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





#pragma mark - 1:闪购
@property(nonatomic ,assign,readonly) CGRect product_flashGo_Lable_Frame;

#pragma mark - 2:商品图片
@property(nonatomic ,assign,readonly) CGRect product_Url_Frame;


#pragma mark - 3: SOLD OUT
@property(nonatomic ,assign,readonly)CGRect product_SoldOut_ImgView_Frame;


#pragma mark - 4:左上角折扣/价格
@property(nonatomic ,assign,readonly) CGRect product_Discount_ImgView_Frame;

@property(nonatomic ,assign,readonly) CGRect product_Discount_Label_Frame;


#pragma mark - 5: 标题
@property(nonatomic ,assign,readonly) CGRect product_Title_Frame;


#pragma mark - 6: 优惠价与原价

@property(nonatomic ,assign,readonly) CGRect product_Price_Frame;

@property(nonatomic ,assign,readonly) CGRect product_DiscountPrice_Frame;


#pragma mark - 7: Edit和Buy
@property(nonatomic ,assign,readonly) CGRect edit_Frame;

@property(nonatomic ,assign,readonly) CGRect buy_Frame;


//10; 行高
@property(nonatomic,assign,readonly)CGFloat rowHeight;


@property(nonatomic,strong)JSProductCollectionViewCellModel *model;


-(JSProductCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic;


-(void)layoutSubviews:(CGRect)rect;


@end
