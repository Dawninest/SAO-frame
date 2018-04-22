//
//  SAOUtilViewController.m
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/22.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import "SAOUtilViewController.h"

@interface SAOUtilViewController ()

@end

@implementation SAOUtilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor redColor];
    [self initUI];
}

- (void)initUI{
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    effectView.frame = self.view.frame;
    [self.view addSubview:effectView];
    
    UILabel *tipLabel = [[UILabel alloc]init];
    tipLabel.frame = self.view.frame;
    tipLabel.text = @"SAOUtil";
    tipLabel.textColor = [UIColor blackColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tipLabel];
}





@end
