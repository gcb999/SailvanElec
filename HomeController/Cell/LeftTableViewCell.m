//
//  LeftCollectionViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}



-(void)JSTableViewController:(JSTableViewController *)SWCtrl TableViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    self.textLabel.text=@"dd";
    
    
    
}

@end
