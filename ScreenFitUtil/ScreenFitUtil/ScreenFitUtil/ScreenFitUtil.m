//
//  ScreenFitUtil.m
//  ScreenFitUtil
//
//  Created by Jun Zhou on 2018/6/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import "ScreenFitUtil.h"

ScreenFitUtilStruct FitUtil;

static inline UIFont * screenFitFont(CGFloat fontSize);
static inline UIFont * screenFitBoldFont(CGFloat fontSize);
static inline UIFont * screenFitFontWithFontName(NSString *fontName, CGFloat fontSize);
static inline CGFloat screenFitFloat(CGFloat num);

/**
 * GCC的扩展语法（黑魔法），由它修饰过的函数，会在main函数之前调用。原理是在ELF的.ctors段增加一条函数引用
 * 加载器在执行main函数前，检查.ctror section，并执行里面的函数。
 * 如果有多个attribute((constructor))修饰的函数有依赖，他们调用顺序是不确定的
 *
 */

__attribute__ ((constructor)) static void initialize_ScreenFitUtil () {
    
    FitUtil.screenWidth         = [UIScreen mainScreen].bounds.size.width;
    FitUtil.screenHeight        = [UIScreen mainScreen].bounds.size.height;
    FitUtil.screenSize          = [UIScreen mainScreen].bounds.size;
    
    FitUtil.isIPhone            = [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"];
    FitUtil.isIPhoneX           = (FitUtil.isIPhone && FitUtil.screenHeight == 812);
    FitUtil.isPad               = [[[UIDevice currentDevice] model] isEqualToString:@"iPad"];
    
    FitUtil.statusBarHeight           = (FitUtil.isIPhoneX ? 44 : 20);
    FitUtil.bottomSafeHeight          = (FitUtil.isIPhoneX ? 34 : 0);
    FitUtil.tabBarHeight              = 49 + FitUtil.bottomSafeHeight;
    FitUtil.navigationBarHeight       = 44;
    FitUtil.navigationStatusBarHeight = FitUtil.navigationBarHeight + FitUtil.statusBarHeight;
    
    // 适配函数赋值
    FitUtil.fitFont = screenFitFont;
    FitUtil.fitBoldFont = screenFitBoldFont;
    FitUtil.fitFontWithFontName = screenFitFontWithFontName;
    FitUtil.fitFloat = screenFitFloat;
    
    if (FitUtil.isIPhone) {
        
        switch ((NSInteger)FitUtil.screenWidth) {
                
            case 320: {  /// 5/SE 320
                FitUtil.fitScale            = 0.85;
            } break;
                
            case 375: {  /// 6/6s iPhoneX 375 Base
                FitUtil.fitScale            = 1;
            } break;
                
            case 414: {  /// 6sPlus 7Plus 8Plus  414
                FitUtil.fitScale            = 1.1;
            } break;
                
            default:
                FitUtil.fitScale            = 1;
                break;
        }
        
    } else if (FitUtil.isPad) {
        
        // TODO: ....
        
    } else {
        FitUtil.fitScale                    = 1;
    }
}


static inline UIFont * screenFitFont(CGFloat fontSize) {
    return [UIFont systemFontOfSize:fontSize * FitUtil.fitScale];
}

static inline UIFont * screenFitBoldFont(CGFloat fontSize) {
    return [UIFont boldSystemFontOfSize:fontSize * FitUtil.fitScale];
}

static inline UIFont * screenFitFontWithFontName(NSString *fontName, CGFloat fontSize) {
    return [UIFont fontWithName:fontName size:fontSize * FitUtil.fitScale];
}

static inline CGFloat screenFitFloat(CGFloat num) {
    return (num) * FitUtil.fitScale;
}













