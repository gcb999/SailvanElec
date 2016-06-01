//
//  JSProductListCollectionViewCellModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JSProductListCollectionViewCellModel : NSObject
#pragma mark - 1:商品图片
@property(nonatomic ,copy)NSString *product_Url;


#pragma mark -2:左上角折扣/价格
@property(nonatomic ,assign)BOOL is_Discount;
@property(nonatomic ,copy)NSString *product_Discount;


#pragma mark - 3: 标题
@property(nonatomic ,copy)NSString *product_Title;


#pragma mark - 4: color,size ,type
@property(nonatomic ,copy)NSString *product_Color;

@property(nonatomic ,copy)NSString *product_Size;

@property(nonatomic ,copy)NSString *product_Type;



#pragma mark -5: 数量
@property(nonatomic ,copy)NSString *product_Quntity;


#pragma mark - 6: 优惠价与原价
@property(nonatomic ,copy)NSString *product_Price;

@property(nonatomic ,copy)NSString *product_DiscountPrice;


#pragma mark -7：闪购时间和图片
@property(nonatomic ,assign)BOOL is_FlashGo;
@property(nonatomic ,copy)NSString *product_flashGo_Time;//闪购时间

#pragma mark -8:免邮
@property(nonatomic,assign)BOOL is_free_shipping;//商品是否免邮


#pragma mark -sold Out
@property(nonatomic ,assign)BOOL is_SoldOut;

#pragma mark - Edit和Buy
@property(nonatomic,assign)BOOL is_edit_buy;

-(JSProductListCollectionViewCellModel *)initWithDic:(NSDictionary *)dic;

@end
