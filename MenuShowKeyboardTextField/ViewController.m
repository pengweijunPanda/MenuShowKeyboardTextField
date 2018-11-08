//
//  ViewController.m
//  MenuShowKeyboardTextField
//
//  Created by pengweijun on 2018/11/8.
//  Copyright © 2018年 彭伟军. All rights reserved.
//

#import "ViewController.h"
#import "MenuShowKeyboardTextField.h"
#import "MenuShowkeyboardControl.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MenuShowkeyboardControl *btn;
@property (weak, nonatomic) IBOutlet MenuShowKeyboardTextField *textField;

@end

static NSString * const UIMenuWillHideNotification = @"UIMenuWillHideNotification";

@implementation ViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
}

- (IBAction)hideKeyboard:(UIButton *)sender {
    [self.textField resignFirstResponder];
}

- (IBAction)btnClick:(UIButton *)sender {
    
    if (self.textField.isFirstResponder) {
        
        self.textField.textFieldResponder = sender;
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(menuWillHide) name:UIMenuWillHideNotification object:nil];
        
    }else{
        
        [sender becomeFirstResponder];
        
    }
    
    
    CGRect rect = sender.frame;
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    UIMenuItem *a = [[UIMenuItem alloc] initWithTitle:@"剪切"
                                               action:@selector(cut:)];
    menu.menuItems = @[a];
    
    [menu setTargetRect:rect inView:self.view];
    
    [menu setMenuVisible:YES animated:YES];
    
}

- (void)keyboardWillShow{
    [UIMenuController sharedMenuController].menuItems = nil;
}

- (void)menuWillHide{
    self.textField.textFieldResponder = nil;
    
    [UIMenuController sharedMenuController].menuItems = nil;
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIMenuWillHideNotification object:nil];
    
}

- (void)cut:(id)sender{
    NSLog(@"--aAction--");
    [UIPasteboard generalPasteboard].string = self.textField.text?:@"";
    
}


@end
