//
//  PositionViewController.m
//  iOSAnimationSample
//
//  Created by Cloudox on 16/2/4.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "PositionViewController.h"

@interface PositionViewController ()
@property (strong, nonatomic) IBOutlet UIView *blueSquare;// 蓝色方块
@property (strong, nonatomic) IBOutlet UIView *redSquare;// 红色方块
@property (strong, nonatomic) IBOutlet UIView *greenSquare;// 绿色方块

@end

@implementation PositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 在进入界面的时候开始动画
    [UIView animateWithDuration:1 animations:^{
        // 改变蓝色方块的位置
        CGPoint blueCenter = self.blueSquare.center;
        blueCenter.x = self.view.bounds.size.width - self.blueSquare.center.x;
        self.blueSquare.center = blueCenter;
    }];
    
    // 延迟进行的动画
    [UIView animateWithDuration:1 delay:0.5 options:nil animations:^{
        // 改变红色方块的位置
        CGPoint redCenter = self.redSquare.center;
        redCenter.y = self.view.bounds.size.height - self.redSquare.center.y;
        self.redSquare.center = redCenter;
    } completion:nil];
    
    // 延迟进行的动画
    [UIView animateWithDuration:1 delay:1 options:nil animations:^{
        // 改变绿色方块位置
        CGPoint greenCenter = self.greenSquare.center;
        greenCenter.x = self.view.bounds.size.width - self.greenSquare.center.x;
        greenCenter.y = self.view.bounds.size.height - self.greenSquare.center.y;
        self.greenSquare.center = greenCenter;
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
