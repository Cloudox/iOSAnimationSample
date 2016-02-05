//
//  ColorViewController.m
//  iOSAnimationSample
//
//  Created by Cloudox on 16/2/5.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()
@property (strong, nonatomic) IBOutlet UIView *blueSquare;// 蓝色方块
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;// 名字label

@end

@implementation ColorViewController

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
    
    // 改变颜色
    [UIView animateWithDuration:1 animations:^{
        self.blueSquare.backgroundColor = [UIColor redColor];
        self.nameLabel.textColor = [UIColor whiteColor];
    }];
}

@end
