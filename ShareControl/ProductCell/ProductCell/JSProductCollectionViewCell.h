//
//  JSProductViewCell.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSProductCollectionViewCellFrameModel.h"

@interface JSProductCollectionViewCell : UICollectionViewCell<JSCollectionViewCellDelegate>


//1:背景图
@property(nonatomic ,strong)UIImageView *bgImgView;

//8：闪购时间
@property(nonatomic,strong)UILabel *product_flashGo_label;

//2:大图
@property(nonatomic ,strong)UIImageView *productImgView;


//3:左上角折扣/价格

@property(nonatomic,strong)UIImageView *product_Discount_ImgView;
@property(nonatomic,strong)UILabel *product_Discount_Lable;



//3: 标题
@property(nonatomic,strong)UILabel *product_Title_Lable;

//4: 优惠价与原价

@property(nonatomic ,strong)UILabel *product_Price_Label;
@property(nonatomic ,strong)UILabel *product_DiscountPrice_Label;

//5:编辑和购买

@property(nonatomic,strong)JSDIYButton *editBtn;

@property(nonatomic,strong)JSDIYButton *buyBtn;


@end
