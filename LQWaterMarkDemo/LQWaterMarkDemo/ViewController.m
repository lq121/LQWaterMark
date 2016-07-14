//
//  ViewController.m
//  LQWaterMarkDemo
//
//  Created by v大夫 on 16/7/14.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "ViewController.h"
#import "LQWaterMark.h"

@interface ViewController ()

@end

@implementation ViewController


static  NSString*  const urlStr1 = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3062734635,4183904616&fm=96";

static  NSString* const urlStr2 = @"http://d.hiphotos.baidu.com/image/h%3D360/sign=47fad766cebf6c81e8372aee8c3fb1d7/962bd40735fae6cda0f1986f0db30f2442a70f72.jpg";
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:imageView];
    
    
    [LQWaterMark watermarkWithURL:[NSURL URLWithString:urlStr2] andWatermarkImage:[UIImage imageNamed:@"demo"] andBlock:^(UIImage * watermarkImage)
     {
         
         [imageView setImage:watermarkImage];
     }];
    
    
    UIImageView *imageView2 = [[UIImageView alloc]init];
    imageView2.frame = CGRectMake(100, 200, 200,200);
    [self.view addSubview:imageView2];
    
    
    [LQWaterMark watermarkWithURL:[NSURL URLWithString:urlStr2] andWatermarkURL:[NSURL URLWithString:urlStr1] andBlock:^(UIImage * watermarkImage) {
        [imageView2 setImage:watermarkImage];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
