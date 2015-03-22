//
//  ZC_InputViewButton.m
//  BedTime
//
//  Created by Jason on 3/9/15.
//  Copyright (c) 2015 Jason. All rights reserved.
//

#import "ZC_InputViewButton.h"

@interface ZC_InputViewButton()<UIPickerViewDelegate>

@property (nonatomic, strong)UITextField *tf;

@property (nonatomic, strong)UIDatePicker *picker;

@end


@implementation ZC_InputViewButton

static char overviewKey;

@dynamic event;

- (NSDate *)date{
    if (_date == nil) {
        _date = [NSDate date];
    }
    
    return _date;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self commonInit];
    
}

- (void)commonInit{
    
    self.tf = [[UITextField alloc] init];
    
    [self addSubview:self.tf];
    
     self.picker = [[UIDatePicker alloc] init];
    
    self.picker.backgroundColor = [UIColor clearColor];
    
    self.picker.datePickerMode = UIDatePickerModeTime;
    
    [self.picker addTarget:self action:@selector(pickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.tf.inputView = self.picker;
    
    self.tf.hidden = YES;
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    toolBar.barStyle = UIBarStyleDefault;
//    toolBar.backgroundColor = [UIColor clearColor];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    self.tf.inputAccessoryView = toolBar;
    
}

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        
        [self.tf becomeFirstResponder];
        
        block();
    }
}

- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode{
    
    _datePickerMode = datePickerMode;
    
    self.picker.datePickerMode = datePickerMode;
}
/*
- (void)myAddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    [self.tf becomeFirstResponder];
    
    [self myAddTarget:target action:action forControlEvents:controlEvents];

}
 */
// actions
- (void)cancelTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tf resignFirstResponder];
    
    if ([self.myDelegate respondsToSelector:@selector(inputButton:cancelButtonPressed:)]) {
        [self.myDelegate inputButton:self cancelButtonPressed:sender];
    }
}

- (void)doneTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tf resignFirstResponder];
    
    if ([self.myDelegate respondsToSelector:@selector(inputButton:doneButtonPressed:)]) {
        [self.myDelegate inputButton:self doneButtonPressed:sender];
    }
    // perform some action
    
}

- (void)pickerValueChanged:(UIDatePicker *)picker{
    
    self.date = picker.date;
    
    if ([self.myDelegate respondsToSelector:@selector(inputButton:pickerValueDidChanged:)]) {
        [self.myDelegate inputButton:self pickerValueDidChanged:picker];
    }
//    NSDate *date = picker.date;
    
//    self.titleLabel.text =  [NSString stringWithFormat:@"%@", picker.date];
}

/// ========================== zc  =================================
/*
+ (BOOL)swizzleMethodOrginalMtd:(SEL)origSelector newMtd:(SEL)altSelector{
    
    Method origMethod = class_getInstanceMethod([self class], origSelector);
    if (nil == origMethod) {
        
        return NO;
        
    }
    
    Method altMethod = class_getInstanceMethod([self class], altSelector);
    if (nil == altMethod) {
        
        return NO;
    }
    
    BOOL didAddMethod =
    class_addMethod([self class],
                    origSelector,
                    method_getImplementation(altMethod),
                    method_getTypeEncoding(altMethod));
    
    if (didAddMethod) {
        class_replaceMethod([self class],
                            altSelector,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, altMethod);
    }
    
    return YES;
}
*/

@end
