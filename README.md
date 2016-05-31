# UIPickerView
简介：UIPickerView 是一个选择器控件，它比 UIDatePicker 更加通用，它可以生成单列的选择器，也可生成多列的选择器，而且开发者完全可以自定义选择项的外观，因此用法非常灵活。

UIPickerView 直接继承了 UIView ，没有继承 UIControl ，因此，它不能像 UIControl 那样绑定事件处理方法， UIPickerView 的事件处理由其委托对象完成。使用UIPickerView的对象应该遵守 UIPickerViewDataSource,UIPickerViewDelegate。 
