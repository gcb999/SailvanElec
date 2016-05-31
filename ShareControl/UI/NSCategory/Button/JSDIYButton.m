//
//  JSCommonButton.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSDIYButton.h"

#define KJSDIYImageView 0.5
#define KJSDIYPadding 0

@implementation JSDIYButton



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //设置image
        self.adjustsImageWhenDisabled=NO;
        self.adjustsImageWhenHighlighted=NO;
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
       
        //设置title
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font=KNormalFontSize;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat width=contentRect.size.width;
    CGFloat height=contentRect.size.height;
    return CGRectMake(KJSDIYPadding,0 , width*KJSDIYImageView, height);
    
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat width=contentRect.size.width;
    CGFloat height=contentRect.size.height;
    CGFloat x=width*(KJSDIYImageView)+KJSDIYPadding+KJSDIYPadding;
    return CGRectMake(x, 0, width-x, height);
}

@end
