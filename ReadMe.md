#ZCDatePicker button

This is a magic Button which could call a picker keyboard that can be called in input views.

![icon](https://github.com/Jasonbroker/ZCDatePickerButton/blob/master/Mar%2022,%202015%2010:06.gif?raw=true)

you can create the button in 2 ways:

1. in the IB
2. code
than Please USE the block:
		- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action; 

Then add the things you want to into the block, just as the `addtarget:` do;

It contains 3 delegates to handle the events;

	- (void)inputButton:(ZC_InputViewButton *)inputButton doneButtonPressed:(UIBarButtonItem *)sender;

	- (void)inputButton:(ZC_InputViewButton *)inputButton cancelButtonPressed:(UIBarButtonItem *)sender;

	- (void)inputButton:(ZC_InputViewButton *)inputButton pickerValueDidChanged:(UIDatePicker *)picker;

assign the viewcontroller to be the delegete to handle these methods.

	self.myBtn.myDelegete = self;

You can choose the date picker mode from `UIDatePickerMode` and get date from `.date` property.


**However, DONT TRY TO USE THIS FRAMEWORK IN COCOA(OS X)**

IT IS LIGHTWEIGHT FRAMEWORK AND OSX IS NOT SUPPORTED!

I am an iOS developer and OS X is beyond me. Sry guys.


license: MIT 

