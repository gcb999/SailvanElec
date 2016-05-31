//
//  JSProductCollectionViewCellFrameModel.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductCollectionViewCellFrameModel.h"

@implementation JSProductCollectionViewCellFrameModel
-(JSProductCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic{
    
    if (self=[super init]) {
        
        self.model=[[JSProductCollectionViewCellModel alloc] initWithDic:dic];
        

        
#pragma mark -左边
        
        //1：商品图片大小
        _rowHeight+=120;
        
        //2: 标题
        if(IS_NSString(self.model.product_Title)){
            _rowHeight+=35;
        }
        //3: 价格
        if (IS_NSString(self.model.product_DiscountPrice)) {
            _rowHeight+=20;
        }
        

       //最后要把rowHeight适当添加高度
        _rowHeight+=10;

        
    }
    return self;
    
    
}

-(void)layoutSubviews:(CGRect)rect{
    
    CGRect hrect;
    
    //1: 大图
    CGRectDivide(rect, &hrect, &rect, 120, CGRectMinYEdge);
    _product_Url_Frame=hrect;
    
    
    //2:折扣图片 和文字
    if(self.model.is_Discount){
        
        _product_Discount_ImgView_Frame=CGRectMake(0, 0, 40, 40);
        _product_Discount_Label_Frame=CGRectMake(0, 0, 28, 28);
        
    }
    else{
        _product_Discount_ImgView_Frame=CGRectZero;
        _product_Discount_Label_Frame=CGRectZero;
    }
    
    //3: 标题
    if(IS_NSString(_model.product_Title)){
        CGRectDivide(rect, &hrect, &rect, 35, CGRectMinYEdge);
        _product_Title_Frame=hrect;
        
    }
    else{
        _product_Title_Frame=CGRectZero;
    }
 
    //4: 价格
    if (!IS_NSString(self.model.product_DiscountPrice)) {//特价为空
        
        
        _product_Price_Frame=CGRectZero;//原价
        _product_DiscountPrice_Frame=CGRectZero;//折扣价
        
    }
    else{
    CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
    if(!IS_NSString(self.model.product_Price)  || [self.model.product_DiscountPrice isEqualToString:self.model.product_Price]){//只显示特价
        
        _product_Price_Frame=CGRectZero;//原价
       _product_DiscountPrice_Frame=hrect;//折扣价
     
        
    }
    else{
        
        CGRect priceRect;
        CGFloat width=hrect.size.width*0.5f;
        CGRectDivide(hrect, &priceRect, &hrect,width,CGRectMinXEdge);
        _product_Price_Frame=UIEdgeInsetsInsetRect(priceRect, UIEdgeInsetsMake(0, 0, 0, 5));//原价
        _product_DiscountPrice_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, 0, 0, 0));//折扣价
        
    }
        
    }

    
    
    
}

@end
