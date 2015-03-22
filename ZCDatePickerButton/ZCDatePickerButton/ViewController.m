//
//  ViewController.m
//  ZCDatePickerButton
//
//  Created by Jason on 3/22/15.
//  Copyright (c) 2015 Jason. All rights reserved.
//

#import "ViewController.h"
#import "ZC_InputViewButton.h"

@interface ViewController ()<ZC_InputViewButtonDelegate>
@property (weak, nonatomic) IBOutlet ZC_InputViewButton *myBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.myBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        NSLog(@"pressed");
    }];
    
    self.myBtn.myDelegate = self;
}

- (void)inputButton:(ZC_InputViewButton *)inputButton cancelButtonPressed:(UIBarButtonItem *)sender{
    
    NSLog(@"You canceled");
    
}

- (void)inputButton:(ZC_InputViewButton *)inputButton doneButtonPressed:(UIBarButtonItem *)sender{
    
    NSLog(@"Done");
}

- (void)inputButton:(ZC_InputViewButton *)inputButton pickerValueDidChanged:(UIDatePicker *)picker{
    
    [self.myBtn setTitle:[NSString stringWithFormat:@"%@", self.myBtn.date] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
