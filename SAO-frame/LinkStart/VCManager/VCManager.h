//
//  VCManager.h
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/22.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RootViewController.h"
#import "SAOUtilViewController.h"
#import "MainViewController.h"

@interface VCManager : NSObject

@property (nonatomic,strong) RootViewController *rootViewController;
@property (nonatomic,strong) SAOUtilViewController *SAOUtil;
@property (nonatomic,strong) MainViewController *mainViewController;

+ (VCManager *)shareManager;//单例

@end
