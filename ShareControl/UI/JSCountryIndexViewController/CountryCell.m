//
//  CountryCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "CountryCell.h"

@interface CountryCell (){
    
    
}
@property (nonatomic , strong) UIImageView *bgImgView;
@property (nonatomic , strong) UIImageView *iconImgView;
@property (nonatomic , strong) UILabel *nameLabel;
@end


@implementation CountryCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //背景图片
        self.bgImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.contentView addSubview:self.bgImgView];
        //图片
        self.iconImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.bgImgView addSubview:self.iconImgView];
        
        //名字
        self.nameLabel=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.nameLabel];

        
    }
    return self;
}

-(void)JSTableViewController:(JSTableViewController *)JSCtrl sections:(NSArray *)sections rowsOfSections:(NSDictionary<NSString *,NSArray *> *)rowsOfSections indexPath:(NSIndexPath *)indexpath{
    
    NSString *str=sections[indexpath.section];
    NSArray *tempArr=rowsOfSections[str];
    CountryModel *model=tempArr[indexpath.row];
    self.nameLabel.text=model.countryName;
    
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect hrect,rect=self.contentView.bounds;
    

    if (IS_NSString(self.model.iconUrl)) {//有图标
        
       
        CGRectDivide(rect, &hrect, &rect, 40, CGRectMinXEdge);
        
        CGSize size=CGSizeMake(30, 30);
        
        CGFloat width=(hrect.size.width-size.width)*0.5f;
        
        CGFloat heigth=(hrect.size.height-size.height)*0.5f;
        
        
        self.iconImgView.frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(heigth, width, heigth, width));
        
        self.nameLabel.frame=rect;

       
    }
    else{//没有图标
        
         self.nameLabel.frame=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 0));
    }
    

    
}


@end
