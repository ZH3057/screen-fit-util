//
//  ViewController.m
//  ScreenFitUtil
//
//  Created by Jun Zhou on 2018/6/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import "ViewController.h"

#import "ScreenFitUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"isIPhone: %@", FitUtil.isIPhone ? @"YES" : @"NO");
    NSLog(@"isPad: %@", FitUtil.isPad ? @"YES" : @"NO");
    NSLog(@"isIPhoneX: %@", FitUtil.isIPhoneX ? @"YES" : @"NO");
    
    NSLog(@"statusBarHeight: %f", FitUtil.statusBarHeight);
    NSLog(@"bottomSafeHeight: %f", FitUtil.bottomSafeHeight);
    NSLog(@"tabBarHeight: %f", FitUtil.tabBarHeight);
    NSLog(@"navigationBarHeight: %f", FitUtil.navigationBarHeight);
    NSLog(@"navigationStatusBarHeight: %f", FitUtil.navigationStatusBarHeight);
    
    NSLog(@"fitScale: %f", FitUtil.fitScale);
    NSLog(@"fitFont: %@", FitUtil.fitFont(10));
    NSLog(@"fitBoldFont: %@", FitUtil.fitBoldFont(10));
    NSLog(@"fitFloat: %f", FitUtil.fitFloat(10));
}





@end
