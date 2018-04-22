//
//  MainViewController.m
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/22.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI{
    UIImageView *backImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"appBack.PNG"]];
    backImg.frame = self.view.frame;
    [self.view addSubview:backImg];
    

}


@end
