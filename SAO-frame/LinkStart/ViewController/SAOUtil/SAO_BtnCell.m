//
//  SAO_BtnCell.m
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/23.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

// 
#import "SAO_BtnCell.h"

@interface SAO_BtnCell ()

@property(nonatomic,strong) UIImageView *cellBack;
@property(nonatomic,strong) UIImageView *cellValue;

@end

@implementation SAO_BtnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.CellChoose = NO;
        [self initCell];
    }
    return self;
}

- (void)initCell{
    [self addSubview:self.cellBack];
    [self.cellBack addSubview:self.cellValue];
}

- (void)setBtnByParams:(NSDictionary *)Params{
    self.BtnCellName = [Params objectForKey:@"name"];
    self.CellChoose = [[Params objectForKey:@"status"] isEqualToString:@"choose"] ? YES : NO;
    UIImage *cellValueImg = [self getCellValue:self.BtnCellName cellStatus:self.CellChoose];
    UIImage *cellBackImg = self.CellChoose ? [UIImage imageNamed:@"btn_press.png"] : [UIImage imageNamed:@"btn_normal.png"];
    [self.cellBack setImage:cellBackImg];
    [self.cellValue setImage:cellValueImg];
}

- (UIImage *)getCellValue:(NSString *)cellName cellStatus:(BOOL)choosed{
    NSString *imageName = @"";
    if([cellName isEqualToString:@"user"]){
        imageName = choosed ? @"info_hover.png" : @"info_normal.png";
    }else if([cellName isEqualToString:@"like"]){
        imageName = choosed ? @"netw_conn_hover.png" : @"netw_conn_normal.png";
    }else if([cellName isEqualToString:@"chat"]){
        imageName = choosed ? @"mail1_hover.png" : @"mail1_normal.png";
    }else {//set
        imageName = choosed ? @"setting_hover.png" : @"setting_normal.png";
    }
    return [UIImage imageNamed:imageName];
}



- (UIImageView *)cellBack{
    if(!_cellBack){
        _cellBack = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 64, 64)];
    }
    return _cellBack;
}

- (UIImageView *)cellValue{
    if(!_cellValue){
        _cellValue = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 34, 34)];
    }
    return _cellValue;
}


@end
