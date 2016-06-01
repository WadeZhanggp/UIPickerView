//
//  ViewController.m
//  UIPickerView
//
//  Created by 张光鹏 on 16/5/31.
//  Copyright © 2016年 Tsinova. All rights reserved.
//

#import "ViewController.h"
#import "TSIPickerView.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *teams;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 100, 200)];
    //_pickerView.backgroundColor = [UIColor grayColor];
    
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    _teams = @[@"0档",@"1档",@"2档",@"3档"];
    //[_pickerView selectedRowInComponent:1];
    [self.view addSubview:_pickerView];
    
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _teams.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
// 中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    //[_pickerView selectedRowInComponent:1];
    return [_teams objectAtIndex:row];
    
}



// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"你选中的默认档位是：%@",[ _teams objectAtIndex:row]] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [successAlert addAction:okButton];
    [self presentViewController:successAlert animated:YES completion:nil];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TSIPickerView *pickerView = [[TSIPickerView alloc] initWithFrame:self.view.bounds];
    [pickerView show:self.view withRow:1];
}

@end
