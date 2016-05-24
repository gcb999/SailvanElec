//
//  NSData+stringFromDate.m
//  JSThridPod
//
//  Created by gcb999 on 16/5/18.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSData+stringFromDate.h"

@implementation NSData (stringFromDate)


#pragma mark - 日期装换字符串

-(NSString *)stringFromDate:(NSDate *)currentDate{
    
    
    return  [self stringFromDate:currentDate dateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    
}

-(NSString *)stringFromDate:(NSDate *)currentDate dateFormat:(NSString *)dateFormat{
    
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:dateFormat];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //输出currentDateString
    NSLog(@"%@",currentDateString);
    return currentDateString;
}




@end
