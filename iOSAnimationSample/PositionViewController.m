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
        
        // 改变红色方块的位置
        CGPoint redCenter = self.redSquare.center;
        redCenter.y = self.view.bounds.size.height - self.redSquare.center.y;
        self.redSquare.center = redCenter;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
