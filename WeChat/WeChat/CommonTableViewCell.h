//
//  CommonTableViewCell.h
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellLineStyle) {
    CellLineStyleDefault,
    CellLineStyleFill,
    CellLineStyleNone,
};

@interface CommonTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, assign) float leftFreeSpace;

@property (nonatomic, assign) CellLineStyle bottomLineStyle;
@property (nonatomic, assign) CellLineStyle topLineStyle;

@end
