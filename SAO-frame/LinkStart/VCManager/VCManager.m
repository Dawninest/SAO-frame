//
//  VCManager.m
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/22.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import "VCManager.h"

@implementation VCManager

static VCManager *manager = nil;

/**
 *   创建单例
 *   @return manager
 */
+ (VCManager *)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[VCManager alloc]init];
    });
    return manager;
}

#pragma mark -- getter
- (SAOUtilViewController *)SAOUtil{
    if(_SAOUtil == nil){
        _SAOUtil = [[SAOUtilViewController alloc] init];
    }
    return _SAOUtil;
}

- (MainViewController *)mainViewController{
    if(_mainViewController == nil){
        _mainViewController = [[MainViewController alloc] init];
    }
    return _mainViewController;
}


- (RootViewController *)rootViewController{
    if(_rootViewController == nil){
        _rootViewController = [[RootViewController alloc] initWithMainVC:self.mainViewController SAOUtil:self.SAOUtil];
    }
    return _rootViewController;
}


@end
