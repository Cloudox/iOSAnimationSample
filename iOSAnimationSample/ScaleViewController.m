//
//  ScaleViewController.m
//  iOSAnimationSample
//
//  Created by Cloudox on 16/2/5.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "ScaleViewController.h"

@interface ScaleViewController ()
@property (strong, nonatomic) IBOutlet UIView *blueSquare;// 蓝色方块

@end

@implementation ScaleViewController

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
    
    // 进行一秒钟的动画
    [UIView animateWithDuration:1 animations:^{
        self.blueSquare.transform = CGAffineTransformMakeScale(2.0, 2.0);// 长和宽分别变成原来的两倍
    }];
}

@end
