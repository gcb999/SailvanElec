//
//  NSData+stringFromDate.h
//  JSThridPod
//
//  Created by gcb999 on 16/5/18.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (stringFromDate)


#pragma mark - 日期装换字符串

-(NSString *)stringFromDate:(NSDate *)currentDate;

-(NSString *)stringFromDate:(NSDate *)currentDate dateFormat:(NSString *)dateFormat;



@end
