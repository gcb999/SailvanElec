//
//  JSPlaceOrderCollectionViewCellFrameModel.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSPlaceOrderCollectionViewCellFrameModel.h"
#define KJSPlaceOrderPadding 5

@implementation JSPlaceOrderCollectionViewCellFrameModel

-(JSPlaceOrderCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic{
    
    if (self=[super init]) {
        
        self.model=[[JSPlaceOrderCollectionViewCellModel alloc] initWithDic:dic];
        
        CGRect hrect,lrect,rect=CGRectMake(0, 0, IPHONScreenWidth, 100000);
        
#pragma mark -左边
        
#pragma mark - 1:商品图片
        _product_Url_Frame=CGRectMake(0, 0, 120, 120);
        
        
#pragma mark -2:左上角折扣/价格
        if(self.model.is_Discount){

            _product_Discount_ImgView_Frame=CGRectMake(0, 0, 40, 40);
            _product_Discount_Label_Frame=CGRectMake(0, 0, 28, 28);
            
        }
        else{
            _product_Discount_ImgView_Frame=CGRectZero;
            _product_Discount_Label_Frame=CGRectZero;
        }
        

        
#pragma mark -右边
        CGFloat width=_product_Url_Frame.size.width;
        CGRectDivide(rect, &lrect, &rect,width , CGRectMinXEdge);
        rect=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 5));

#pragma mark - 3: 标题
        CGRectDivide(rect, &hrect, &rect, 40, CGRectMinYEdge);
        _product_Title_Frame=hrect;
        
        _rowHeight+=40;
        
        
#pragma mark - 4: color,size ,type

        if(IS_NSString(self.model.product_Color)){
            CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
            _product_Color_Frame=hrect;
            
            _rowHeight+=20;
        }
        else{
            _product_Color_Frame=CGRectZero;
        }
      
        
        //size
        if(IS_NSString(self.model.product_Size)){
            CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
            _product_Size_Frame=hrect;
            _rowHeight+=20;
        }
        else{
            _product_Size_Frame=CGRectZero;
        }
        
        //type
        if(IS_NSString(self.model.product_Type)){
            CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
            _product_Type_Frame=hrect;
            _rowHeight+=20;
        }
        else{
            _product_Type_Frame=CGRectZero;
        }
        
#pragma mark -5: 数量
        CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
        _product_Quntity_Frame=hrect;
        _rowHeight+=20;
        
#pragma mark - 6: 优惠价与原价
        if (!IS_NSString(self.model.product_DiscountPrice)) {//特价为空
            
       
            _product_Price_Frame=CGRectZero;//原价
            _product_DiscountPrice_Frame=CGRectZero;//折扣价
            
        }
        else{//---
     
            CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
            _rowHeight+=20;
        if(!IS_NSString(self.model.product_Price)  || [self.model.product_DiscountPrice isEqualToString:self.model.product_Price]){//只显示特价
             
             _product_Price_Frame=CGRectZero;//原价
             _product_DiscountPrice_Frame=hrect;//折扣价
             
         }
         else{
            
             CGRect priceRect;
          
             
             CGRectDivide(hrect, &priceRect, &hrect, 40, CGRectMinXEdge);
             
             _product_Price_Frame=UIEdgeInsetsInsetRect(priceRect, UIEdgeInsetsMake(0, 0, 0, KJSPlaceOrderPadding));//原价
             _product_DiscountPrice_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, KJSPlaceOrderPadding, 0, 0));//折扣价
         }
            
        }
        
#pragma mark -7：闪购时间和图片 图片大小 30*30
        if (self.model.is_FlashGo) {
            CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
            CGRect flashgoRect;
            CGRectDivide(hrect, &flashgoRect, &hrect, 30, CGRectMinXEdge);
            _product_flashGo_ImgView_Frame=flashgoRect;
            _product_flashGo_Lable_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, KJSPlaceOrderPadding, 0, 0));
            
            _rowHeight+=30;
            
            
        }
        else{
            _product_flashGo_ImgView_Frame=CGRectZero;
            _product_flashGo_Lable_Frame=CGRectZero;
            
        }
#pragma mark -8:免邮 图片大小 30*30
        if(self.model.is_free_shipping){
            
            CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
            CGRect freeshippingRect;
            CGRectDivide(hrect, &freeshippingRect, &hrect, 30, CGRectMinXEdge);
            _product_freeshipping_Frame=freeshippingRect;
            
            _rowHeight+=30;
            
        }
        else{
              _product_freeshipping_Frame=CGRectZero;
        }
        
#pragma mark -9:sold Out 图片大小 30*30
        if (self.model.is_SoldOut) {
            
            CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
            CGRect soldOutRect;
            CGRectDivide(hrect, &soldOutRect, &hrect, 30, CGRectMinXEdge);
            _product_SoldOut_Frame=soldOutRect;
            
            _rowHeight+=30;

        }
        else{
            _product_SoldOut_Frame=CGRectZero;
            
        }
       
        //间距
        CGRectDivide(rect, &hrect, &rect, 10, CGRectMinYEdge);
         _rowHeight+=10;
        
#pragma mark -10： 线
      
        CGRect lineRect;
        CGRectDivide(rect, &lineRect, &rect, 1, CGRectMinYEdge);
        _product_line_Frame=CGRectMake(0,lineRect.origin.y+lineRect.size.height, IPHONScreenWidth,1 );
        
 
        //最后要把rowHeight适当添加高度
        _rowHeight+=5;
        if (_rowHeight<=_product_Url_Frame.size.height) {
            _rowHeight+=_product_Url_Frame.size.height+5;
        }
        
    }
    return self;
    
    
}



@end
