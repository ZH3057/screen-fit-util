//
//  ScreenFitUtil.h
//  ScreenFitUtil
//
//  Created by Jun Zhou on 2018/6/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    
    CGSize  screenSize;
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    BOOL isIPhone;
    BOOL isIPhoneX;
    BOOL isPad;
    
    // 状态栏高度
    CGFloat statusBarHeight;
    
    // 底部安全区域高度
    CGFloat bottomSafeHeight;
    
    // tab栏高度(包含安全区域距离)
    CGFloat tabBarHeight;
    
    // 导航栏高度
    CGFloat navigationBarHeight;
    
    // 导航栏 & 状态栏 高度
    CGFloat navigationStatusBarHeight;
    
    // 适配比例
    CGFloat fitScale;
    
    // 适配font
    UIFont * (*fitFont)(CGFloat);
    
    // 适配粗体font
    UIFont * (*fitBoldFont)(CGFloat);
    
    // 适配特定字体font
    UIFont * (*fitFontWithFontName)(NSString *, CGFloat);
    
    // 适配float
    CGFloat (*fitFloat)(CGFloat);
    
} ScreenFitUtilStruct;

extern ScreenFitUtilStruct FitUtil;


// MARK: - 适配Macros

#define FITFONT(FontSize) [UIFont systemFontOfSize:FontSize * FitUtil.fitScale]
#define FITBOLDFONT(FontSize) [UIFont boldSystemFontOfSize:FontSize * FitUtil.fitScale]
#define FITFONTWITHFONTNAME(FontName, FontSize) [UIFont fontWithName:FontName size:FontSize * FitUtil.fitScale]

#define FITFLOAT(num) ((num) * FitUtil.fitScale)




