//
//  UIView+WX.h
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WX)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;

@property (nonatomic, assign) CGFloat frameRight;
@property (nonatomic, assign) CGFloat frameBottom;

@property (nonatomic, assign) CGFloat frameWidth;
@property (nonatomic, assign) CGFloat frameHeight;

- (BOOL) containsSubView:(UIView *)subView;
- (BOOL) containsSubViewOfClassType:(Class)aClass;

@end
