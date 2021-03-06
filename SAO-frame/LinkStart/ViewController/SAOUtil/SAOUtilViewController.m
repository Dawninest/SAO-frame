//
//  SAOUtilViewController.m
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/22.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import "SAOUtilViewController.h"
#import "SAO_BtnCell.h"
#import "SAO_SoundManager.h"

#define SC_H [UIScreen mainScreen].bounds.size.height
#define SC_W [UIScreen mainScreen].bounds.size.width
#define CELL_H 74

@interface SAOUtilViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UIVisualEffectView *effectView;
@property(nonatomic,strong) UITableView *SAO_Table;
@property(nonatomic,strong) NSArray *SAO_BtnArr;


@end

@implementation SAOUtilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)initData{
    NSArray *secondList = @[@{@"name":@"二级菜单-1"},
                            @{@"name":@"二级菜单-2"},
                            @{@"name":@"二级菜单-3"},
                            @{@"name":@"二级菜单-4"}];
    self.SAO_BtnArr = @[@{@"name":@"user",@"status":@"empty",@"nextList":secondList},
                        @{@"name":@"like",@"status":@"empty",@"nextList":secondList},
                        @{@"name":@"chat",@"status":@"empty",@"nextList":secondList},
                        @{@"name":@"set",@"status":@"empty",@"nextList":secondList}];
}

- (void)initUI{
    self.view.alpha = 0;
    [self.view addSubview:self.effectView];
    [self.view addSubview:self.SAO_Table];
}

- (void)linkStart{
    NSLog(@"--------------------------linkstart--------------------------");
    [SAO_SoundManager playMusic:@"launch_pop" Loop:NO];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:0 animations:^{
        self.SAO_Table.frame = CGRectMake((SC_W - CELL_H) / 2, (SC_H - CELL_H * [self.SAO_BtnArr count]) / 2, CELL_H, CELL_H * [self.SAO_BtnArr count]);
        self.view.alpha = 1;
    } completion:^(BOOL finished) {
        [self chooseCellName:@"user"];
    }];
}

- (void)linkEnd{
    NSLog(@"--------------------------linkEnd--------------------------");
    [SAO_SoundManager playMusic:@"launch_miss" Loop:NO];
    [UIView animateWithDuration:0.2 delay:0 options:0  animations:^{
        self.SAO_Table.frame = CGRectMake((SC_W - CELL_H) / 2, (SC_H - CELL_H * [self.SAO_BtnArr count]) / 4, CELL_H, CELL_H * [self.SAO_BtnArr count]);
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self clearBtnList];
    }];
}

- (void)chooseCellName:(NSString *)cellName{
    [self loadNewBtnArr:cellName status:@"choose"];
    [SAO_SoundManager playMusic:@"feedback" Loop:NO];
    [self openNextList:cellName];
}

- (void)clearBtnList{
    [self loadNewBtnArr:@"all" status:@"empty"];
}

- (void)loadNewBtnArr:(NSString *)cellName status:(NSString *)newStatus{
    NSMutableArray *newArray = [NSMutableArray array];
    for (NSMutableDictionary *btnDic in self.SAO_BtnArr) {
        NSString *btnName = [btnDic objectForKey:@"name"];
        NSString *chooseStatus = [btnName isEqualToString:cellName] ? newStatus : @"empty";
        NSDictionary *newBtnDic = @{@"name":btnName,@"status":chooseStatus};
        [newArray addObject:newBtnDic];
    }
    self.SAO_BtnArr = [NSMutableArray arrayWithArray:newArray];
    [self.SAO_Table reloadData];
}

- (void)openNextList:(NSString *)chooseCellName{
    //[SAO_SoundManager playMusic:@"menu" Loop:NO];
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.SAO_BtnArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //table view的重用机制
    static NSString *cellIdentifer = @"SAO_Cell";
    SAO_BtnCell *SAO_Cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!SAO_Cell) {
        SAO_Cell = [[SAO_BtnCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifer];
        [SAO_Cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    SAO_Cell.backgroundColor = [UIColor clearColor];
    NSDictionary *cellParams = self.SAO_BtnArr[indexPath.row];
    [SAO_Cell setBtnByParams:cellParams];
    
    return SAO_Cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消cell选中的颜色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SAO_BtnCell *SAO_Cell = [tableView cellForRowAtIndexPath:indexPath];
    [self chooseCellName:SAO_Cell.BtnCellName];
}

- (UIVisualEffectView *)effectView{
    if(!_effectView){
        _effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _effectView.frame = self.view.frame;
    }
    return _effectView;
}

- (UITableView *)SAO_Table{
    if(!_SAO_Table){
        _SAO_Table = [[UITableView alloc]initWithFrame:CGRectMake((SC_W - CELL_H) / 2, (SC_H - CELL_H * [self.SAO_BtnArr count]) / 4, CELL_H, CELL_H * [self.SAO_BtnArr count])];
        _SAO_Table.rowHeight = CELL_H;
        _SAO_Table.backgroundColor = [UIColor clearColor];
        _SAO_Table.separatorStyle = UITableViewCellSelectionStyleNone;
        _SAO_Table.scrollEnabled = NO;
        _SAO_Table.delegate = self;
        _SAO_Table.dataSource = self;
    }
    return _SAO_Table;
}





@end
