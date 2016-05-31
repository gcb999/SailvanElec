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


//1:闪购
@property(nonatomic ,assign)BOOL is_FlashGo;
@property(nonatomic ,copy)NSString *product_flashGo_Time;//闪购时间

//2:大图
@property(nonatomic ,copy)NSString *product_Url;


//3:左上角折扣/价格
@property(nonatomic ,assign)BOOL is_Discount;
@property(nonatomic ,copy)NSString *product_Discount;


//4: 标题
@property(nonatomic ,copy)NSString *product_Title;


//5: 优惠价与原价

@property(nonatomic ,copy)NSString *product_Price;

@property(nonatomic ,copy)NSString *product_DiscountPrice;


//6: Edit和Buy
@property(nonatomic,assign)BOOL is_edit_buy;

//7：卖光
@property(nonatomic ,assign)BOOL is_SoldOut;

//8:免邮
@property(nonatomic,assign)BOOL is_free_shipping;//商品是否免邮




@end
