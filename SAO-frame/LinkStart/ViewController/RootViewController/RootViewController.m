//
//  RootViewController.m
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/22.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import "RootViewController.h"

#define SC_H [UIScreen mainScreen].bounds.size.height
#define SC_W [UIScreen mainScreen].bounds.size.width


@interface RootViewController ()

@property(nonatomic,strong) MainViewController *mainVC;
@property(nonatomic,strong) SAOUtilViewController *SAOUtil;


@property(nonatomic,assign) BOOL linkStart;
@property(nonatomic,assign) float fristTouchOffsetY;
@property(nonatomic,assign) float secondTouchOffsetY;

@end

@implementation RootViewController

- (instancetype)initWithMainVC:(MainViewController *)mainVC SAOUtil:(SAOUtilViewController *)SAOUtil
{
    self = [super init];
    if (self) {
        self.mainVC = mainVC;
        self.SAOUtil = SAOUtil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self initUI];
}

- (void)initData{
    self.linkStart = NO;
    self.fristTouchOffsetY = 0;
    self.secondTouchOffsetY = 0;
}

- (void)initUI{
    [self addChildViewController:self.mainVC];
    self.SAOUtil.view.alpha = 0;
    [self addChildViewController:self.SAOUtil];
    
}

- (void)SAOUtilLink:(BOOL)link{
    if(self.linkStart != link){
        self.linkStart = link;
        link ? [self.SAOUtil linkStart] : [self.SAOUtil linkEnd];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *nowTouchs = [event.allTouches allObjects];
    if(nowTouchs.count == 2){ // 双指限定
        UITouch *touchOne = nowTouchs[0];
        UITouch *touchTwo = nowTouchs[1];
        // touchOne
        CGPoint locationOne = [touchOne preciseLocationInView:self.view];
        CGPoint prevLocationOne = [touchOne precisePreviousLocationInView:self.view];
        // touchTwo
        CGPoint locationTwo = [touchTwo preciseLocationInView:self.view];
        CGPoint prevLocationTwo = [touchTwo precisePreviousLocationInView:self.view];
        self.fristTouchOffsetY += locationOne.y - prevLocationOne.y;
        self.secondTouchOffsetY += locationTwo.y - prevLocationTwo.y;
        BOOL linkLine = (fabs(self.fristTouchOffsetY) > SC_H / 3) && (fabs(self.secondTouchOffsetY) > SC_H / 3);
        if(!self.linkStart && linkLine && self.fristTouchOffsetY > 0 && self.secondTouchOffsetY > 0 ){
            // 下拉 启动 SAO-Util
            [self clearOffsetY];
            [self SAOUtilLink:YES];
        }
        if(self.linkStart && linkLine && self.fristTouchOffsetY < 0 && self.secondTouchOffsetY < 0){
            // 上拉 关闭 SAO-Util
            [self clearOffsetY];
            [self SAOUtilLink:NO];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self clearOffsetY];
}

- (void)clearOffsetY{
    self.fristTouchOffsetY = 0;
    self.secondTouchOffsetY = 0;
}

#pragma mark -- Getter
- (void)addChildViewController:(UIViewController *)childController{
    [super addChildViewController:childController];
    [self.view addSubview:childController.view];
    [childController didMoveToParentViewController:self];
}


@end
