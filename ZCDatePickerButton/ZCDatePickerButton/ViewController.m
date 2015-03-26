//
//  ViewController.m
//  ZCDatePickerButton
//
//  Created by Jason on 3/22/15.
//  Copyright (c) 2015 Jason. All rights reserved.
//

#import "ViewController.h"
#import "ZCPickerButton.h"

@interface ViewController ()<ZCPickerButtonDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet ZCPickerButton *myBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.myBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        NSLog(@"pressed");
    }];
    
    self.myBtn.myDelegate = self;
    self.myBtn.picker.delegate = self;
    
}

#pragma mark - data source

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 2;     //这个picker里的组键数
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    return 3;  //数组个数
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label;
    if (view == nil) {
        
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
    }
    
    label.text = @"nima";
    label.textColor = [UIColor whiteColor];
    
    return label;
}




///
- (void)inputButton:(ZCPickerButton *)inputButton cancelButtonPressed:(UIBarButtonItem *)sender{
    
    NSLog(@"You canceled");
    
}

- (void)inputButton:(ZCPickerButton *)inputButton doneButtonPressed:(UIBarButtonItem *)sender{
    
    NSLog(@"Done");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
