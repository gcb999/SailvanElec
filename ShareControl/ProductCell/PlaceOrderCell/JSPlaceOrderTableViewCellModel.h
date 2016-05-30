//
//  JSPlaceOrderCollectionViewCellModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSPlaceOrderTableViewCellModel : NSObject

//1:大图
@property(nonatomic ,copy)NSString *product_Url;


//2:左上角折扣/价格
@property(nonatomic ,assign)BOOL is_Discount;
@property(nonatomic ,copy)NSString *product_Discount;



//3: 标题
@property(nonatomic ,copy)NSString *product_Title;


//4: color,size ,type,数量
@property(nonatomic ,copy)NSString *product_Color;

@property(nonatomic ,copy)NSString *product_Size;

@property(nonatomic ,copy)NSString *product_Type;

@property(nonatomic ,copy)NSString *product_Quntity;





//5: 优惠价与原价

@property(nonatomic ,copy)NSString *product_Price;

@property(nonatomic ,copy)NSString *product_DiscountPrice;


//6：卖光
@property(nonatomic ,assign)BOOL is_SoldOut;

//7:闪购
@property(nonatomic ,assign)BOOL is_FlashGo;
@property(nonatomic ,copy)NSString *product_flashGo_Time;//闪购时间



//8:免邮
@property(nonatomic,assign)BOOL is_free_shipping;//商品是否免邮


-(JSPlaceOrderTableViewCellModel *)initWithDic:(NSDictionary *)dic;

@end
