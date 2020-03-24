//
//  ViewController.m
//  滑动弹窗
//
//  Created by 李小龙 on 2020/3/21.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import "ViewController.h"
#import "OHExtensionMenu.h"
@interface ViewController ()<OHExtensionMenuDelegate>
@property (nonatomic,strong) OHExtensionMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.view.backgroundColor = [UIColor whiteColor];
    [self test];
}

- (void)test
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
       btn.frame = CGRectMake(100, 100, 100, 100);
       [btn setTitle:@"扩展" forState:UIControlStateNormal];
       [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:btn];
       
}


- (void)btnClick
{
    OHExtensionMenu *menu = [[OHExtensionMenu alloc] init];
       [self.view addSubview:menu];
       menu.backgroundColor = [UIColor redColor];
    menu.ohDelegate = self;
    NSArray *array = @[@"浏览名片",@"名片转发",@"复制微信",@"获取电话",@"保存名片",@"点击开户链接",@"觉得靠谱",@"查看说说",@"打开说说",@"查看帮助",@"查看官网",@"个人观点互动",@"查看产品",@"查看产品详情",@"用户咨询",@"浏览名片",@"名片转发",@"复制微信",@"获取电话",@"保存名片",@"点击开户链接",@"觉得靠谱",@"查看说说",@"打开说说",@"查看帮助",@"查看官网",@"个人观点互动",@"查看产品",@"查看产品详情",@"用户咨询",@"浏览名片",@"名片转发",@"复制微信",@"获取电话",@"保存名片",@"点击开户链接",@"觉得靠谱",@"查看说说",@"打开说说",@"查看帮助",@"查看官网",@"个人观点互动",@"查看产品",@"查看产品详情",@"用户咨询"];
       
    menu.dataArray = [NSArray arrayWithArray:array];
    self.menu = menu;
}

- (void)extensionMenuDidClickCloseBtn
{
    [self.menu removeFromSuperview];
}

- (void)extensionMenuDidClickExtensionButton:(UIButton *)btn
{
    NSLog(@"%@",btn.titleLabel.text);
}




@end
