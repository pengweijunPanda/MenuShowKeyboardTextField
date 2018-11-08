+ 目的：UITextField/UITextView使用时展示UIMenu （键盘不下去）

---
#####关键点1

修改 UITextField 的响应链顺序，在需要展示UIMenu时让 UITextField 的 nextResponder改成触发展示键盘的控件，在demo中就是赋值给 UIButton。

    //CustomTextField/TextView's override nextResponder
    - (UIResponder *)nextResponder{ //UITextField 响应链修改位置
       if (self.textFieldResponder) {
          return self.textFieldResponder;
        }
        return [super nextResponder];
    }
---
    //showMenuView Action
    - (IBAction)btnClick:(UIButton *)sender {
    
        if (self.textField.isFirstResponder) {
          //键盘弹出时处理，监听 UIMenuControllerWillHideMenuNotification,目标是消失Menu时让TextField的响应链恢复如初
        
            self.textField.textFieldResponder = sender;
        
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(menuWillHide) name:UIMenuControllerWillHideMenuNotification object:nil];
        
        }else{
        
            [sender becomeFirstResponder];
        
        }
    
        //Blablabla Menu展示代码
    }

---
#####关键点2
修改触发展示键盘的控件

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
        NSLog(@"--cut--");
    }


---
#总结
1.UIMenuController这个单例控件用完每次都清空，以免其他场景业务不同不满足需求。
2.响应链顺序决定了UIMenu与键盘能否同时展示的关键。

+ 简书地址：https://www.jianshu.com/p/ae297b9d3741
