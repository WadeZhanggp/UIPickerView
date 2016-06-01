//
//  TSIPickerView.m
//  UIPickerView
//
//  Created by 张光鹏 on 16/5/31.
//  Copyright © 2016年 Tsinova. All rights reserved.
//

#import "TSIPickerView.h"

#define GRAYVIEW_COLOR [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1]
#define CERTAINBUTTON_COLOR [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1]

@interface TSIPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIButton *certainButton;
@property (nonatomic, strong) UIButton *cancleButton;
@property (nonatomic, strong) UIView *alertBackgroundView;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIButton *blackView;
@property (nonatomic, strong) NSArray *teams;

@end

@implementation TSIPickerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.blackView = [[UIButton alloc] initWithFrame:frame];
        [self layoutUI];
        
    }
    return self;
}

- (void)layoutUI{
    
    self.blackView.backgroundColor = [UIColor blackColor];
    self.blackView.alpha = 0;
    [self.blackView addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.blackView];
    
    self.alertBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 225)];
    self.alertBackgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.alertBackgroundView];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 180)];
    //self.backgroundColor = GRAYVIEW_COLOR;
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    //self.pickerView.
    self.teams = @[@"0档",@"1档",@"2档",@"S档(建议设置为1档或N档，以保证您的骑行安全)"];
    [self.alertBackgroundView addSubview:self.pickerView];
    
    self.certainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.certainButton.frame = CGRectMake(0, 180, self.bounds.size.width, 45);
    //self.certainButton.titleLabel.text = @"确定";
    [self.certainButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.certainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.certainButton addTarget:self action:@selector(clickToCertain) forControlEvents:UIControlEventTouchUpInside];
    self.certainButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.certainButton.backgroundColor = GRAYVIEW_COLOR;
    [self.alertBackgroundView addSubview:self.certainButton];
}

- (void)show:(UIView *)view withRow:(NSInteger)row{
    
    [view addSubview:self];
    [self.pickerView selectRow:row inComponent:0 animated:YES];//设置默认第几列第几行
    [UIView animateWithDuration:0.25 delay:0 options:7 << 16 animations:^{
        self.alpha = 1;
        self.blackView.alpha = 0.5;
        self.alertBackgroundView.frame = CGRectMake(0, self.bounds.size.height - 225, self.bounds.size.width, 225);
    } completion:^(BOOL finished) {
        
    }];
    
}

//取消弹出pickerView
- (void)clickCancel{
    [UIView animateWithDuration:0.25 delay:0 options:7 << 16 animations:^{
        self.alertBackgroundView.frame =  CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 225);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

//确定点击事件
- (void)clickToCertain{
    
    NSLog(@"确定");
    [self clickCancel];
    
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _teams.count;
}

//调整高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 60;
}

//自定义每行view
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *customerLabel = nil;
    customerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 60)];
    customerLabel.textAlignment = NSTextAlignmentCenter;
    customerLabel.font = [UIFont systemFontOfSize:14];;
    customerLabel.text = [_teams objectAtIndex:row];
    return customerLabel;
}

// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"选中档位：%ld档",(long)row);
    
}

@end
