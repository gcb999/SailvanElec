//
//  JSPlaceOrderCollectionViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSPlaceOrderCollectionViewCell.h"


@interface JSPlaceOrderCollectionViewCell ()

@property(nonatomic,strong)JSPlaceOrderCollectionViewCellFrameModel *frameModel;

@end

@implementation JSPlaceOrderCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        //背景图片
        self.bgImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.contentView addSubview: self.bgImgView];
        
        
        
        //商品图片
        
        self.productImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [ self.bgImgView addSubview:self.productImgView];
        
        
 #pragma mark - 左上角折扣
        
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
//        self.product_Discount_Lable.transform=CGAffineTransformMakeRotation(-M_PI/4);
        [self.product_Discount_ImgView addSubview:self.product_Discount_Lable];
   
        
        //标题
        self.product_Title_Lable=[UILabel LabWithFrame:CGRectZero text:@"商品标题" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter  font:KNormalFontSize];
        self.product_Title_Lable.numberOfLines=2;
        [self.bgImgView addSubview:self.product_Title_Lable];
        
#pragma mark - color,size,type,数量
        
        self.product_Color_Lable=[UILabel LabWithFrame:CGRectZero text:@"Color:" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Color_Lable];
        
        self.product_Size_Lable=[UILabel LabWithFrame:CGRectZero text:@"Size:" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Size_Lable];
        
        self.product_Type_Lable=[UILabel LabWithFrame:CGRectZero text:@"Type" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Type_Lable];
        
        
        self.product_Quntity_Lable=[UILabel LabWithFrame:CGRectZero text:@"数量" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Quntity_Lable];
        
        
#pragma mark -价格
        
        
        //原价
        self.product_Price_Label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft font:KNormalFontSize];
        [ self.bgImgView addSubview:self.product_Price_Label];
        
        
        //特价
        self.product_DiscountPrice_Label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft font:[UIFont boldSystemFontOfSize:16]];
        [ self.bgImgView addSubview:self.product_DiscountPrice_Label];
        
        
#pragma mark -闪购图片和时间
        
        //闪购 图片
        self.product_flashGo_ImgView=[UIImageView ImageViewImageName:@"ti" frame:CGRectZero];
        [self.bgImgView addSubview:self.product_flashGo_ImgView];
        
        //闪购 时间
        self.product_flashGo_label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_flashGo_label];

        
        
#pragma mark -sold Out
        self.product_SoldOutImgview=[UIImageView ImageViewImageName:@"sout" frame:CGRectZero];
        [self.bgImgView addSubview:self.product_SoldOutImgview];


        
        
#pragma mark -免邮
        self.product_Free_Imgview=[UIImageView ImageViewImageName:@"free_shipping_new" frame:CGRectZero];
        [self.bgImgView addSubview:self.product_Free_Imgview];
        
        //线
        self.lineImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        self.lineImgView.layer.borderColor=rgb(230, 230, 231).CGColor;
        self.lineImgView.layer.borderWidth=0.25f;
        [self.bgImgView addSubview:self.lineImgView];
        
        
        
        
        
    }
    return self;
}


-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{

    self.frameModel=JSCtrl.data[indexpath.row];
    JSPlaceOrderCollectionViewCellModel *model =self.frameModel.model;
   
    //1: 商品图片
    [self loadingSmallPlaceholderImageName:model.product_Url imgview:self.productImgView];
    
    //2：商品折扣
        NSString *str=[NSString stringWithFormat:@"-%d%%",indexpath.row*8];
    self.product_Discount_Lable.text=str;//model.product_Discount;
    
    
    //3:标题
    self.product_Title_Lable.text=model.product_Title;
    
    //4: color,size,type
    self.product_Color_Lable.text=model.product_Color;
    self.product_Size_Lable.text=model.product_Size;
    self.product_Type_Lable.text=model.product_Type;
    
    //5：数量
    self.product_Quntity_Lable.text=model.product_Quntity;
    
    //6:原价与特价
    NSMutableAttributedString *attr=[[NSMutableAttributedString alloc] init];
    self.product_Price_Label.attributedText= [attr attributedStringWithtitle:model.product_Price Font:KNormalFontSize color:[UIColor grayColor] isShowUnderlineStyle:NO isStrikethroughStyle:YES];
    self.product_DiscountPrice_Label.text=model.product_DiscountPrice;
    
    
    //7：闪购时间
//    self.product_flashGo_label.text=model.product_flashGo_Time;
    [self setFlashGo];
    
    
    
    

}


#pragma mark -赋值
-(void)setFlashGo{
    
    
    //服务器记录时间
    NSDate *severDate=[self.frameModel.model.product_flashGo_Time dateFromString];
    if (self.frameModel.model.is_FlashGo) {//是闪购商品
           NSDate *nowDate=[NSDate date];
           long  tempcounttime=[severDate timeIntervalSinceDate:nowDate];//现在时间-服务器记录时间
            if(tempcounttime>0){//正常时间
                
                NSInteger seconds = tempcounttime% 60;
                NSInteger minutes = (tempcounttime / 60) % 60;
                NSInteger hours = (tempcounttime / 3600);
                NSString *timeString = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", (long)hours, (long)minutes, (long)seconds];
                self.product_flashGo_label.text=timeString;
                
            }
            else{//超时,重新请求服务器
                
            
            }
        
    }
}





-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    
 
#pragma mark -左边坐标布局
    
    //1:背景图坐标
    self.bgImgView.frame=self.contentView.bounds;
    
    
    
    //2:商品图片坐标
  
    self.productImgView.frame=self.frameModel.product_Url_Frame;

    //3:折扣图片
    self.product_Discount_ImgView.frame=self.frameModel.product_Discount_ImgView_Frame;;
    
  //4：折扣文字
    self.product_Discount_Lable.frame=self.frameModel.product_Discount_Label_Frame;
    self.product_Discount_Lable.transform=CGAffineTransformMakeRotation(-M_PI/4);//必须加入
    
   
#pragma mark -右边坐标布局
    
  
    //1: 标题

    self.product_Title_Lable.frame=self.frameModel.product_Title_Frame;
    
    //2: color type,size
    self.product_Color_Lable.frame=self.frameModel.product_Color_Frame;
    
    self.product_Type_Lable.frame=self.frameModel.product_Size_Frame;
    
    self.product_Size_Lable.frame=self.frameModel.product_Type_Frame;
    
    //3：数量
    self.product_Quntity_Lable.frame=self.frameModel.product_Quntity_Frame;
    
    //4: 价格和特价
    self.product_Price_Label.frame=self.frameModel.product_Price_Frame;
    self.product_DiscountPrice_Label.frame=self.frameModel.product_DiscountPrice_Frame;
    
    
    //5: 闪购时间和图片
    self.product_flashGo_ImgView.frame=self.frameModel.product_flashGo_ImgView_Frame;
    self.product_flashGo_label.frame=self.frameModel.product_flashGo_Lable_Frame;
    
    
    //6：免邮
    self.product_Free_Imgview.frame=self.frameModel.product_freeshipping_Frame;
    
    //7：卖光
    self.product_SoldOutImgview.frame=self.frameModel.product_SoldOut_Frame;
    
    //线
    self.lineImgView.frame=self.frameModel.product_line_Frame;
 
    
}



    
    






@end
