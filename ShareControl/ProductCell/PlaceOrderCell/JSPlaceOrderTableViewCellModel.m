//
//  JSPlaceOrderCollectionViewCellModel.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSPlaceOrderTableViewCellModel.h"

@implementation JSPlaceOrderTableViewCellModel

-(JSPlaceOrderTableViewCellModel *)initWithDic:(NSDictionary *)dic{
    
    if (self=[super init]) {
        
        //图片
        self.product_Url=@"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg";
        
        //折扣
        self.is_Discount=YES;
        self.product_Discount=@"-80%";
        
        //标题
        self.product_Title=@"标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试";
        
        //color,size,color
        
        self.product_Color=@"color: 红色";
        
        self.product_Size=@"size:xl,l";
        
        self.product_Type=@"type:xxxxxxx";
        
        //数量
        self.product_Quntity=@"qty: 5";
        
        
        //原件和特价
        
        self.product_Price=@"$80";
        self.product_DiscountPrice=@"$50";
        
        
        //卖光
        self.is_SoldOut=YES;
        
        //闪购
        self.is_FlashGo=YES;
        self.product_flashGo_Time=@"00:23:34:00";
        
        //免邮
        self.is_free_shipping=YES;
        
        
        
        
        
        
    }
    return self;
    
    
}






@end
