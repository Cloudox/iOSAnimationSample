//
//  RotationViewController.m
//  iOSAnimationSample
//
//  Created by Cloudox on 16/2/5.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *wheelImg;// 滚轮图片

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 持续旋转动画
- (void)spin {
    // options属性设置可以让其顺畅地循环转动，completion让其不断在完成之后调用自己
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.wheelImg.transform = CGAffineTransformRotate(self.wheelImg.transform, M_PI);// 第一个参数为开始旋转的角度，第二个为旋转的角度
    }completion:^(BOOL finished){// 结束时继续执行
        [self spin];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 旋转半圆的动画，如果旋转2*M_PI，会不动
//    [UIView animateWithDuration:1 animations:^{
//        self.wheelImg.transform = CGAffineTransformMakeRotation(M_PI);
//    }];
    
    [self spin];// 持续旋转
}

@end
