//
//  MenuShowKeyboardTextField.m
//  MenuShowKeyboardTextField
//
//  Created by pengweijun on 2018/11/8.
//  Copyright © 2018年 彭伟军. All rights reserved.
//

#import "MenuShowKeyboardTextField.h"

@implementation MenuShowKeyboardTextField

- (UIResponder *)nextResponder{
    if (self.textFieldResponder) {
        return self.textFieldResponder;
    }
    return [super nextResponder];
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (self.textFieldResponder) {
        return NO;
    }else{
        return [super canPerformAction:action withSender:sender];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
