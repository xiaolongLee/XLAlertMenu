//
//  OHExtensionMenu.h
//  滑动弹窗
//
//  Created by 李小龙 on 2020/3/21.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class OHExtensionMenu;
@protocol OHExtensionMenuDelegate <NSObject>

@optional
- (void)extensionMenuDidClickCloseBtn;
- (void)extensionMenuDidClickExtensionButton:(UIButton *)btn;
@end
@interface OHExtensionMenu : UIScrollView
@property (nonatomic, weak) id<OHExtensionMenuDelegate> ohDelegate;
@property (nonatomic,strong) NSArray *dataArray;
@end

NS_ASSUME_NONNULL_END
