//
//  HotCountryCell.m
//  CountryIndexView
//
//  Created by hjl on 16/6/1.
//  Copyright © 2016年 hjl. All rights reserved.
//
#define IPHONEWidth [[UIScreen mainScreen] bounds].size.width
#define RGB(R, G, B) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0]
#import "HotCountryCell.h"

@interface HotCountryCell ()

@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UIView *midView;

@end



@implementation HotCountryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.midView];
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, 200, 14)];
        _titleLabel.text = @"hot countries";
        _titleLabel.textColor = RGB(51, 51, 51);
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

- (UIView *)midView
{
    if (_midView == nil) {
        _midView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), IPHONEWidth - 12, 72)];
    }
    return _midView;
}

- (void)setHotArray:(NSArray *)hotArray
{
    _hotArray = hotArray;
    for (UIView * view in self.midView.subviews) {
        [view removeFromSuperview];
    }
    for (int i = 0; i < self.hotArray.count; i ++) {
//        CountryModel * model = self.hotArray[i];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(8 + (IPHONEWidth - 28) / 5 * i,0, (IPHONEWidth - 28) / 5, 72);
        button.tag = i;
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(((IPHONEWidth - 28) / 5 - 28) / 2, 12 , 28, 28)];
        imgView.backgroundColor = [UIColor grayColor];
        
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame) + 8, (IPHONEWidth - 28) / 5, 14)];
        nameLabel.text = self.hotArray[i];
        nameLabel.textColor = RGB(51, 51, 51);
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [button addSubview:imgView];
        [button addSubview:nameLabel];
        [button addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
        [self.midView addSubview:button];
    }
    [self addSubview:self.titleLabel];
}

- (void)tap:(UIButton *)btn
{

}




@end
