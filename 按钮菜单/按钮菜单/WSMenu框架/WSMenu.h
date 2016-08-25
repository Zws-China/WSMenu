//
//  WSMenu.h
//  按钮菜单
//
//  Created by iMac on 16/8/25.
//  Copyright © 2016年 sinfotek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSMenu;
@protocol WSMenuDelegate
- (void) wsMenuDelegateMethod: (WSMenu *) sender;
@end

@interface WSMenu : UIView <UITableViewDelegate, UITableViewDataSource>
{
    NSString *animationDirection;
    UIImageView *imgView;
}
@property (nonatomic, retain) id <WSMenuDelegate> delegate;
@property (nonatomic, retain) NSString *animationDirection;
-(void)hideDropDown:(UIButton *)b;
- (id)showDropDown:(UIButton *)b :(CGFloat *)height :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction;
@end
