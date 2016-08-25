//
//  ViewController.m
//  按钮菜单
//
//  Created by iMac on 16/8/25.
//  Copyright © 2016年 sinfotek. All rights reserved.
//

#import "ViewController.h"
#import "WSMenu.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kTabbarHeight 49
#define kNavHeight 64

@interface ViewController ()<WSMenuDelegate,UIGestureRecognizerDelegate>

@end

@implementation ViewController {
    
    WSMenu *menu1;
    WSMenu *menu2;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bgImg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImg.userInteractionEnabled = YES;
    bgImg.image = [UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:bgImg];
    

    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(15, 100, 150, 35);
    button1.backgroundColor = [UIColor grayColor];
    button1.layer.cornerRadius = 5;
    [button1 setTitle:@"点击弹出menu" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button1.tag = 10;
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(kScreenWidth-130, kScreenHeight-100, 100, 35);
    button2.backgroundColor = [UIColor grayColor];
    button2.layer.cornerRadius = 5;
    [button2 setTitle:@"弹出menu" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.tag = 20;
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}

- (void)button1Action:(UIButton *)btn {
    
    
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 10; i++) {
        [arr addObject:[NSString stringWithFormat:@"%ld",i]];
        
    }
    
    if(menu1 == nil) {
        CGFloat f = 200;
        menu1 = [[WSMenu alloc]showDropDown:btn :&f :arr :nil :@"down"];
        menu1.delegate = self;
    }
    else {
        [menu1 hideDropDown:btn];
        [self rel];
    }
    
}

- (void)button2Action:(UIButton *)btn {
    
    
    NSArray *arr = @[@"life",@"is",@"a",@"long",@"road"];
    
    if(menu2 == nil) {
        CGFloat f = 200;
        menu2 = [[WSMenu alloc]showDropDown:btn :&f :arr :nil :@"up"];
        menu2.delegate = self;
    }
    else {
        [menu2 hideDropDown:btn];
        [self rel];
    }
    
}

- (void) wsMenuDelegateMethod: (WSMenu *) sender {
    [self rel];
}

-(void)rel{
    menu1 = nil;
    menu2 = nil;
}


- (void)tapView {
    UIButton *button1 = (UIButton *)[self.view viewWithTag:10];
    UIButton *button2 = (UIButton *)[self.view viewWithTag:20];
    [menu1 hideDropDown:button1];
    [menu2 hideDropDown:button2];
    [self rel];
}

/*
 当你在一个View上添加了Tap点击事件，同时你又在这个View上放了一个TableView，那么tableViewcell的点击事件就会失去响应。
 
 分析原因：当View上添加了Tap事件之后，Tap在响应链中的位置高于tableViewcell的Select。（tap事件会cancelTouchsInView），所以在View上接收不到来自table的事件，造成失去响应。
 
 因此，当我们点击cell的时候要让tap失去响应或者同时相应。
 
 做法：
 
 如果想让Tap和cell同时相应，将cancelTouchsInView属性设置为NO即可。如果想让table响应cell事件，table外响应Tap事件，那么需要设置一下gesture的代理。
 */
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}
@end
