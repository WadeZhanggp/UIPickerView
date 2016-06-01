//
//  TSIPickerView.h
//  UIPickerView
//
//  Created by 张光鹏 on 16/5/31.
//  Copyright © 2016年 Tsinova. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TSIPickerViewDelegate <NSObject>

- (void)certainActionWithStalls:(NSString *)stall;

@end

@interface TSIPickerView : UIView

@property (nonatomic, weak) id<TSIPickerViewDelegate>delegate;

/*!
 显示PickerView,并设置默认行数
 */
- (void)show:(UIView *)view withRow:(NSInteger)row;

@end
