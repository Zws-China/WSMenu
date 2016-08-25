# WSMenu
按钮点击弹出菜单进行选择

# Photo
![image](https://github.com/Zws-China/WSMenu/blob/master/%E6%8C%89%E9%92%AE%E8%8F%9C%E5%8D%95/%E6%8C%89%E9%92%AE%E8%8F%9C%E5%8D%95/menu.gif)

# How To Use
1.导入文件夹WSMenu框架，在所需要的类中#import "WSMenu.h"

2.声明变量 WSMenu *menu;

3.在按钮事件里面写

- (void)button1Action:(UIButton *)btn {

    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 10; i++) {
        [arr addObject:[NSString stringWithFormat:@"%ld",i]];
    }

    if(menu == nil) {
    CGFloat f = 200;
    menu = [[WSMenu alloc]showDropDown:btn :&f :arr :nil :@"down"];
    menu.delegate = self;
    }
    else {
    [menu hideDropDown:btn];
    menu = nil;
    }

}