//
//  JSProductCollectionViewCellModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSProductCollectionViewCellModel : NSObject

-(JSProductCollectionViewCellModel *)initWithDic:(NSDictionary *)dic;


#pragma mark - 1:闪购

@property(nonatomic ,assign)BOOL is_FlashGo;
@property(nonatomic ,copy)NSString *product_flashGo_Time;//闪购时间

#pragma mark - 2:商品图片
@property(nonatomic ,copy)NSString *product_Url;


#pragma mark - 3: SOLD OUT
@property(nonatomic,assign)BOOL is_SoldOut;


#pragma mark - 4:左上角折扣/价格
@property(nonatomic ,assign)BOOL is_Discount;
@property(nonatomic ,copy)NSString *product_Discount;


#pragma mark - 5: 标题
@property(nonatomic ,copy)NSString *product_Title;


#pragma mark - 6: 优惠价与原价

@property(nonatomic ,copy)NSString *product_Price;

@property(nonatomic ,copy)NSString *product_DiscountPrice;


#pragma mark - 7: Edit和Buy
@property(nonatomic,assign)BOOL is_edit_buy;

//#pragma mark - 8:免邮
//@property(nonatomic,assign)BOOL is_free_shipping;//商品是否免邮




@end
