//
//  NSString+dateFromString.m
//  JSThridPod
//
//  Created by gcb999 on 16/5/18.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSString+dateFromString.h"

@implementation NSString (dateFromString)


#pragma mark - 日期装换字符串

-(NSDate *)dateFromString:(NSString *)dateString{
    
    
    return  [self dateFromString:dateString dateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
}

-(NSDate *)dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat{
    
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:dateFormat];
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:dateString];
    
    return date;
}

@end
