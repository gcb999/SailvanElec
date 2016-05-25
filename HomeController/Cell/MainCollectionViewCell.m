//
//  MainCollectionViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "MainCollectionViewCell.h"


@implementation MainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.aimgview=[UIImageView ImageViewImageName:@"" frame:self.contentView.bounds];
        [self.contentView addSubview:self.aimgview];
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
//    self.backgroundColor=indexpath.item%2==0?[UIColor yellowColor]:[UIColor redColor];
    [self loadingBigPlaceholderImageName:date imgview:self.aimgview];
    
}


@end
