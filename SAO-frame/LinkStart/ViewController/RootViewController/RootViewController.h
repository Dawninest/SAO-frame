//
//  RootViewController.h
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/22.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SAOUtilViewController.h"

@interface RootViewController : UIViewController

- (instancetype)initWithMainVC:(MainViewController *)mainVC SAOUtil:(SAOUtilViewController *)SAOUtil;

@end
