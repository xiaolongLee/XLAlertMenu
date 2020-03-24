//
//  OHExtensionMenu.m
//  滑动弹窗
//
//  Created by 李小龙 on 2020/3/21.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import "OHExtensionMenu.h"
#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width   //获取屏幕宽度
#define SCREEN_HEIGHT       [[UIScreen mainScreen] bounds].size.height  //获取屏幕高度
@interface OHExtensionMenu ()

@property (nonatomic,strong) UIButton *closeBtn;

@end

@implementation OHExtensionMenu

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self createPopView];
}



- (instancetype)init {
    if (self = [super init]) {
        self.dataArray = [NSArray array];
        self.frame = CGRectMake(0, SCREEN_HEIGHT * 0.5, SCREEN_WIDTH, SCREEN_HEIGHT * 0.5);
        
    }
    return self;
}

- (void)createPopView {
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.closeBtn.frame = CGRectMake(self.frame.size.width -30, 0, 30, 30);
//    [self.closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [self.closeBtn setImage:[UIImage imageNamed:@"quit_default"] forState:UIControlStateNormal];
    self.closeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.closeBtn];
    
    [self.closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *array = [NSArray arrayWithArray:self.dataArray];
    
    
        CGFloat btnW = 82;
             CGFloat btnH = 32;
             CGFloat space = 5;
             NSInteger totalCol = 4;
              
             
        for (int i = 0; i < array.count; i++) {
                 UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                 NSInteger row = i / totalCol;
                 NSInteger col = i % totalCol;
    //             btn.tag = [self.dict[titleArray[i]] intValue];
                 CGFloat btnX = 11 + space + col * (btnW + space);
                 CGFloat btnY = 30 + space + row * (btnH + space);
                 btn.frame = CGRectMake( btnX, btnY, btnW, btnH);
                 btn.backgroundColor = [UIColor blackColor];
                 [btn setTitle:array[i] forState:UIControlStateNormal];
                 btn.titleLabel.font = [UIFont systemFontOfSize:15];
                 btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
                 [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                 btn.alpha = 0.5;
                 btn.layer.cornerRadius = 4;
                 btn.layer.borderWidth= 1.0;
                 btn.layer.borderColor = [UIColor whiteColor].CGColor;
                 [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                 [self addSubview:btn];
            if (i == array.count - 1 ) {
                self.contentSize = CGSizeMake(0, btnY + btnH + 10);
            }
        }
    
 
}

- (void)closeBtnClick
{
   if ([_ohDelegate respondsToSelector:@selector(extensionMenuDidClickCloseBtn)]) {
        [_ohDelegate  extensionMenuDidClickCloseBtn];
    }
}

- (void)btnClick:(UIButton *)btn
{
    if ([_ohDelegate respondsToSelector:@selector(extensionMenuDidClickExtensionButton:)]) {
        [_ohDelegate extensionMenuDidClickExtensionButton:btn];
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
