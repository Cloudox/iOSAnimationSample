//
//  OpacityViewController.m
//  iOSAnimationSample
//
//  Created by Cloudox on 16/2/5.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "OpacityViewController.h"

@interface OpacityViewController ()
@property (strong, nonatomic) IBOutlet UIView *blueSquare;// 蓝色方块

@end

@implementation OpacityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 开始透明度动画（一秒完成）
    [UIView animateWithDuration:1 animations:^{
        // 透明度变为0.1
        self.blueSquare.alpha = 0.1;
    }];
}

@end
