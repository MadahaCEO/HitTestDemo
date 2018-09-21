//
//  ViewController.m
//  HitTestDemo
//
//  Created by Apple on 2018/9/21.
//  Copyright © 2018年 马大哈. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CustomView *view = [[CustomView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 80)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
