//
//  JSProductViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductViewCell.h"

@implementation JSProductViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        
  #pragma mark -大背景图片
        self.bgImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.contentView addSubview: self.bgImgView];
        
  
        
  #pragma mark -商品图片
        
        self.productImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [ self.bgImgView addSubview:self.productImgView];
       
        
  #pragma mark -折扣
        
        //左上角 折扣图片
        CGSize size=CGSizeMake(40, 40);
        self.left_discount_imgView=[UIImageView ImageViewImageName:@"sclb_img_bq80x80_Green" frame:CGRectMake(0, 0, size.width, size.height)];
        self.left_discount_imgView.layer.cornerRadius=0;
        self.left_discount_imgView.layer.masksToBounds = YES;
        self.left_discount_imgView.clipsToBounds=YES;
        [self.productImgView addSubview:self.left_discount_imgView];
        
        
        //左上角 折扣文字
        self.left_discount_lable=[UILabel LabWithFrame:CGRectMake(0, 0, 28, 28) text:@"-100%" textColor:[UIColor whiteColor] textAlign:NSTextAlignmentCenter  font:KSmallFontSize];
        self.left_discount_lable.adjustsFontSizeToFitWidth=YES;
//        self.left_discount_lable.transform=CGAffineTransformMakeRotation(-M_PI/4);
        [self.left_discount_imgView addSubview:self.left_discount_lable];
        
        
#pragma mark -价格
        

        //原价
        self.priceLabel=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter font:KNormalFontSize];
        [ self.bgImgView addSubview:self.priceLabel];
        
        
        //特价
        self.discountPriceLabel=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter font:[UIFont boldSystemFontOfSize:16]];
        [ self.bgImgView addSubview:self.discountPriceLabel];
        
        
    
        
        
        
    
        
        
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    //1:大图片
    [self loadingBigPlaceholderImageName:@"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg" imgview:self.productImgView];
    
    NSString *str=[NSString stringWithFormat:@"-%d%%",indexpath.row*8];
    self.left_discount_lable.text=str;
    
    
    
    
    self.priceLabel.text=@"30";
    self.discountPriceLabel.text=@"30";
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGRect hrect, rect=self.contentView.bounds;

    //背景图坐标
    self.bgImgView.frame=rect;
    
    //商品图片坐标
    CGFloat height=rect.size.height-30;
    CGRectDivide(rect, &hrect, &rect, height, CGRectMinYEdge);
    self.productImgView.frame=hrect;
    
    //折扣图片
    CGSize size=CGSizeMake(40, 40);
    self.left_discount_imgView.frame=CGRectMake(0, 0, size.width, size.height);
    
    //折扣文字
    self.left_discount_lable.frame=CGRectMake(0, 0, 28, 28);
    self.left_discount_lable.transform=CGAffineTransformMakeRotation(-M_PI/4);//必须加入
    
    //价格控制
    CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
    [self isShowPrice:hrect];
    
    //控制折扣显示与隐藏
//    [self isShowDiscount];
    
    
    
    

    
    
}


#pragma mark -控制折扣显示与隐藏
-(void)isShowDiscount{
    
    if(self.isHiddenDiscount){
        self.left_discount_lable.hidden=YES;
        self.left_discount_imgView.hidden=YES;
    }
    else{
        self.left_discount_lable.hidden=NO;
        self.left_discount_imgView.hidden=NO;
    }
}

#pragma mark -控制价格显示与隐藏

-(void)isShowPrice:(CGRect)rect{
    
    
    NSString *price=self.priceLabel.text;
    
    NSString *discount_price=self.discountPriceLabel.text;
    
    /*
     
     一：只显示原价
     
     1: 如果折扣价为空
     
     2：原价=折扣价
     
    二 ：其他显示，原价与折扣价
     
     
     */

    
    
    if(!IS_NSString(discount_price)  || [price isEqualToString:discount_price]){//只显示原价
      
        self.discountPriceLabel.hidden=YES;
        self.priceLabel.text=price;
        self.priceLabel.frame=rect;
        self.priceLabel.textAlignment=NSTextAlignmentCenter;
        
    }
    else{
        
        self.discountPriceLabel.hidden=NO;
        CGRect hrect;
        CGFloat width=rect.size.width*0.5f;
        CGRectDivide(rect, &hrect, &rect, width, CGRectMinXEdge);

  
        //原价
        self.priceLabel.text=price;
        self.priceLabel.frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, 0, 0, 5));
        self.priceLabel.textAlignment=NSTextAlignmentRight;
        NSMutableAttributedString *attr=[[NSMutableAttributedString alloc] init];
          self.priceLabel.attributedText= [attr attributedStringWithtitle:price Font:KNormalFontSize color:[UIColor grayColor] isShowUnderlineStyle:NO isStrikethroughStyle:YES];
        
        //特价
        
        self.discountPriceLabel.frame=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 0));
        self.discountPriceLabel.textAlignment=NSTextAlignmentLeft;
        self.discountPriceLabel.text=discount_price;

        
        
        
    }
    
    
    
    
}





@end
