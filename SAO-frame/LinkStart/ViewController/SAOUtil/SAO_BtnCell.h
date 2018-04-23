//
//  SAO_BtnCell.h
//  SAO-frame
//
//  Created by 蒋一博 on 2018/4/23.
//  Copyright © 2018年 Dawninest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAO_BtnCell : UITableViewCell

@property(nonatomic,strong) NSString *BtnCellName;
@property(nonatomic,assign) BOOL CellChoose;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setBtnByParams:(NSDictionary *)Params;

@end
