//
//  ViewController.m
//  SwiftToOCDemo
//
//  Created by xingl on 16/5/15.
//  Copyright © 2016年 yjpal. All rights reserved.
//

#import "ViewController.h"

#import "SwiftToOCDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Color *test = [[Color alloc] init];
    
    [test log];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    
    imgV.image = [test imageWithColor:[UIColor redColor]];
    
    [self.view addSubview:imgV];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, 320, 50)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
- (void)goNext {
    MyViewController *vc = [[MyViewController alloc] init];
    
    self.view.window.rootViewController = vc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
