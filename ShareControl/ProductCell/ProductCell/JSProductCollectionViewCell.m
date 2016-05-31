//
//  JSProductViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductCollectionViewCell.h"


#define KJSProductCollectionPadding 5

@interface JSProductCollectionViewCell ()



@property(nonatomic,strong)JSProductCollectionViewCellFrameModel *frameModel;

@end


@implementation JSProductCollectionViewCell
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
        self.product_Discount_ImgView=[UIImageView ImageViewImageName:@"sclb_img_bq80x80_Green" frame:CGRectMake(0, 0, size.width, size.height)];
        self.product_Discount_ImgView.layer.cornerRadius=0;
        self.product_Discount_ImgView.layer.masksToBounds = YES;
        self.product_Discount_ImgView.clipsToBounds=YES;
        [self.productImgView addSubview:self.product_Discount_ImgView];
        
        
        //左上角 折扣文字
        self.product_Discount_Lable=[UILabel LabWithFrame:CGRectMake(0, 0, 28, 28) text:@"-100%" textColor:[UIColor whiteColor] textAlign:NSTextAlignmentCenter  font:KSmallFontSize];
        self.product_Discount_Lable.adjustsFontSizeToFitWidth=YES;
//        self.left_discount_lable.transform=CGAffineTransformMakeRotation(-M_PI/4);
        [self.product_Discount_ImgView addSubview:self.product_Discount_Lable];
        
        
        
        //标题
        self.product_Title_Lable=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter font:KNormalFontSize];
        self.product_Title_Lable.numberOfLines=2;
        [ self.bgImgView addSubview:self.product_Title_Lable];
        
#pragma mark -价格
        

        //原价
        self.product_Price_Label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter font:KNormalFontSize];
        [ self.bgImgView addSubview:self.product_Price_Label];
        
        
        //特价
        self.product_DiscountPrice_Label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter font:[UIFont boldSystemFontOfSize:16]];
        [ self.bgImgView addSubview:self.product_DiscountPrice_Label];
        
        
    
        
        
        
    
        
        
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    
    self.frameModel=JSCtrl.data[indexpath.row];
   
    //1: 商品图片
    [self loadingSmallPlaceholderImageName:self.frameModel.model.product_Url imgview:self.productImgView];
    
    //2：商品折扣
//    NSString *str=[NSString stringWithFormat:@"-%d%%",indexpath.row*8];
    self.product_Discount_Lable.text=self.frameModel.model.product_Discount;
    
   
    //3：标题
    self.product_Title_Lable.text=self.frameModel.model.product_Title;
    
    
    
    //6:原价与特价
    NSMutableAttributedString *attr=[[NSMutableAttributedString alloc] init];
    self.product_Price_Label.attributedText= [attr attributedStringWithtitle:self.frameModel.model.product_Price Font:KNormalFontSize color:[UIColor grayColor] isShowUnderlineStyle:NO isStrikethroughStyle:YES];
    self.product_DiscountPrice_Label.text=self.frameModel.model.product_DiscountPrice;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGRect  rect=self.contentView.bounds;
    
    //1: 必须调用坐标
    [self.frameModel layoutSubviews:self.contentView.bounds];
    
    //2:背景图坐标
    self.bgImgView.frame=rect;
    
    //3: 大图
    self.productImgView.frame=self.frameModel.product_Url_Frame;
    
    //4： 左上角折扣
    self.product_Discount_ImgView.frame=self.frameModel.product_Discount_ImgView_Frame;
    
    self.product_Discount_Lable.frame=self.frameModel.product_Discount_Label_Frame;
    self.product_Discount_Lable.transform=CGAffineTransformMakeRotation(-M_PI/4);//必须加入

    //5：标题
    self.product_Title_Lable.frame=self.frameModel.product_Title_Frame;
    

    //6：价钱
    self.product_Price_Label.frame=self.frameModel.product_Price_Frame;
    self.product_Price_Label.textAlignment=NSTextAlignmentRight;
    self.product_DiscountPrice_Label.frame=self.frameModel.product_DiscountPrice_Frame;
    self.product_DiscountPrice_Label.textAlignment=NSTextAlignmentLeft;

    
}








@end
