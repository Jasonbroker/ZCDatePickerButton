//
//  ZC_InputViewButton.h
//  BedTime
//
//  Created by Jason on 3/9/15.
//  Copyright (c) 2015 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
@class ZC_InputViewButton;

@protocol ZC_InputViewButtonDelegate <NSObject>


@optional
- (void)inputButton:(ZC_InputViewButton *)inputButton doneButtonPressed:(UIBarButtonItem *)sender;

- (void)inputButton:(ZC_InputViewButton *)inputButton cancelButtonPressed:(UIBarButtonItem *)sender;

- (void)inputButton:(ZC_InputViewButton *)inputButton pickerValueDidChanged:(UIDatePicker *)picker;


@end


typedef void (^ActionBlock)();

@interface ZC_InputViewButton : UIButton

@property (readonly) NSMutableDictionary *event;

@property (nonatomic, assign)UIDatePickerMode datePickerMode;

@property (nonatomic, weak)id<ZC_InputViewButtonDelegate> myDelegate;

@property (nonatomic, strong)NSDate *date;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
