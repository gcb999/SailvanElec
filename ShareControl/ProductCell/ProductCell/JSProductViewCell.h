//
//  JSProductViewCell.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSProductViewCell : UICollectionViewCell<JSCollectionViewCellDelegate>


//1:背景图
@property(nonatomic ,strong)UIImageView *bgImgView;

//2:大图
@property(nonatomic ,strong)UIImageView *productImgView;


//3:左上角折扣/价格
@property(nonatomic,strong)UIImageView *left_discount_imgView;
@property(nonatomic,strong)UILabel *left_discount_lable;

@property(nonatomic,assign)BOOL isHiddenDiscount;//是否显示属性

//4: 优惠价与原价

@property(nonatomic ,strong)UILabel *discountPriceLabel;
@property(nonatomic ,strong)UILabel *priceLabel;





//4:



@end
