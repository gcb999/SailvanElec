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
       
        self.layer.borderWidth=0.26f;
        self.layer.borderColor=KborderColor.CGColor;
        self.backgroundColor=[UIColor whiteColor];
        
  #pragma mark -大背景图片
        self.bgImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.contentView addSubview: self.bgImgView];
        
#pragma mark -闪购图片
        self.product_flashGo_label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter font:KNormalFontSize];
        [ self.bgImgView addSubview:self.product_flashGo_label];
        
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
        
        //编辑和购买
        
        self.editBtn=[[JSDIYButton alloc] initWithFrame:CGRectZero];
        [self.editBtn setImage:[UIImage imageNamed:@"nav_cart_Green"] forState:UIControlStateNormal];
        [self.editBtn setTitle:@"Edit" forState:UIControlStateNormal];
        self.editBtn.layer.cornerRadius=4;
        self.editBtn.backgroundColor=rgb(236, 236, 236);
        [self.editBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImgView addSubview:self.editBtn];
        
        self.buyBtn=[[JSDIYButton alloc] initWithFrame:CGRectZero];
        [self.buyBtn setImage:[UIImage imageNamed:@"nav_cart_Green"] forState:UIControlStateNormal];
        [self.buyBtn setTitle:@"buy" forState:UIControlStateNormal];
        self.buyBtn.layer.cornerRadius=4;
        self.buyBtn.backgroundColor=rgb(236, 236, 236);
        [self.buyBtn addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImgView addSubview:self.buyBtn];
        
    
        
        
        
    
        
        
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    
    self.frameModel=JSCtrl.data[indexpath.row];
   
    //1: 闪购
    [self setFlashGo];
    
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
    
    
    CGRect  rect=self.contentView.bounds;
    
    //1: 必须调用坐标
    [self.frameModel layoutSubviews:self.contentView.bounds];
    
    
    
    //2:背景图坐标
    self.bgImgView.frame=rect;
    
    
    //3:闪购图片坐标
    self.product_flashGo_label.frame=self.frameModel.product_flashGo_Lable_Frame;
    
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
    
    //7:edit,buy坐标
    
    self.editBtn.frame=self.frameModel.edit_Frame;
    self.buyBtn.frame=self.frameModel.buy_Frame;

    
}




-(void)edit:(UIButton *)btn{
    
    
}

-(void)buy:(UIButton *)btn{
    
    
}





@end
