//
//  MenuShowkeyboardControl.m
//  MenuShowKeyboardTextField
//
//  Created by pengweijun on 2018/11/8.
//  Copyright © 2018年 彭伟军. All rights reserved.
//

#import "MenuShowkeyboardControl.h"

@implementation MenuShowkeyboardControl


- (BOOL)canBecomeFirstResponder{

    return YES;
    
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    BOOL isSame = [NSStringFromSelector(action) isEqualToString:NSStringFromSelector(@selector(cut:))];
    NSLog(@"MenuShowkeyboardControl-\n-isSame->%d--\n,action-> %@,",isSame,NSStringFromSelector(action));
    return isSame;
}


- (void)cut:(id)sender{
    NSLog(@"--copy--");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
