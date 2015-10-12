//
//  ViewController.m
//  _objc_msgForward_demo
//
//  Created by yemingyu on 10/12/15.
//  Copyright (c) 2015 yemingyu. All rights reserved.
//

#import "ViewController.h"
#import "Monkey.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Monkey *test = [[Monkey alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
