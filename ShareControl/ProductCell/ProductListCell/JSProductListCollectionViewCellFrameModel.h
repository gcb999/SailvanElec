//
//  JSProductListCollectionViewCellFrameModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSProductListCollectionViewCellModel.h"

@interface JSProductListCollectionViewCellFrameModel : NSObject



#pragma mark - 1:商品图片
@property(nonatomic ,assign,readonly) CGRect product_Url_Frame;


#pragma mark -2:左上角折扣/价格
@property(nonatomic ,assign,readonly) CGRect product_Discount_ImgView_Frame;

@property(nonatomic ,assign,readonly) CGRect product_Discount_Label_Frame;


#pragma mark - 3: 标题
@property(nonatomic ,assign,readonly) CGRect product_Title_Frame;


#pragma mark - 4: color,size ,type
@property(nonatomic ,assign,readonly) CGRect product_Color_Frame;

@property(nonatomic ,assign,readonly) CGRect product_Size_Frame;

@property(nonatomic ,assign,readonly) CGRect product_Type_Frame;

#pragma mark -5: 数量
@property(nonatomic ,assign,readonly) CGRect product_Quntity_Frame;


#pragma mark - 6: 优惠价与原价
@property(nonatomic ,assign,readonly) CGRect product_Price_Frame;

@property(nonatomic ,assign,readonly) CGRect product_DiscountPrice_Frame;


#pragma mark -7：闪购时间和图片
@property(nonatomic ,assign,readonly) CGRect product_flashGo_ImgView_Frame;

@property(nonatomic ,assign,readonly) CGRect product_flashGo_Lable_Frame;


#pragma mark -8:免邮
@property(nonatomic,assign,readonly)CGRect product_freeshipping_Frame;//商品是否免邮

#pragma mark -9:sold Out

@property(nonatomic ,assign,readonly) CGRect product_SoldOut_Frame;

#pragma mark -10： 线
@property(nonatomic ,assign,readonly) CGRect product_line_Frame;


//10; 行高
@property(nonatomic,assign,readonly)CGFloat rowHeight;


@property(nonatomic,strong)JSProductListCollectionViewCellModel *model;


-(JSProductListCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic;


#pragma mark -通过Model 重新算坐标
-(void)layoutModel:(JSProductListCollectionViewCellModel *)model;





@end
