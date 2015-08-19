//
//  ViewController.m
//  打水印
//
//  Created by leyi on 15/8/18.
//  Copyright (c) 2015年 LQ. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

static NSString *urlStr1 = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3062734635,4183904616&fm=96";
static NSString *urlStr2 = @"http://d.hiphotos.baidu.com/image/h%3D360/sign=47fad766cebf6c81e8372aee8c3fb1d7/962bd40735fae6cda0f1986f0db30f2442a70f72.jpg";

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self watermarkWithURLString:urlStr2 andWatermarkImage:@"demo"];
}

/*
 * 使用sawebImage 获取网络图片并将本地的图片进行 水印设置
 * urlStr 传入图片地址
 * waterMarkImage 水印的图片名
 */

- (UIImage*)watermarkWithURLString:(NSString*)urlStr andWatermarkImage:(NSString*)waterMarkImage{
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.view addSubview:imageView];
    imageView.hidden =YES;
    NSURL *url = [NSURL URLWithString:urlStr];
    __block UIImage *watermarkImageView;
    [imageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 开始上下文
        UIGraphicsBeginImageContextWithOptions(image.size, YES, 0.0);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        UIImage *myimage = [UIImage imageNamed:waterMarkImage];
        [myimage drawInRect:CGRectMake(image.size.width -myimage.size.width, image.size.height - myimage.size.height, myimage.size.width , myimage.size.height)];
        UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
        // 结束上下文
        UIGraphicsEndImageContext();
        [self.myImageView setImage:image1];
    }];
    return watermarkImageView;
}

/*
 * 使用队列组给图片打水印
 * image1String 图片的地址
 * image2String 水印图片的地址
 */
- (UIImage*)watermarkWithimage1:(NSString*)image1String andImage2:(NSString*)image2String{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    __block UIImage *image1;
    __block UIImage *image2;
    __block UIImage *watermarkImageView;
    dispatch_group_async(group, queue, ^{
        NSURL *url1 = [NSURL URLWithString:image1String];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        image1 = [UIImage imageWithData:data1];
    });
    
    dispatch_group_async(group, queue, ^{
        NSURL *url2 = [NSURL URLWithString:image2String];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        image2 = [UIImage imageWithData:data2];
    });
    
    dispatch_group_notify(group, queue, ^{
        // 开始上下文
        UIGraphicsBeginImageContextWithOptions(image1.size, YES, 0.0);
        [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
        [image2 drawInRect:CGRectMake(image1.size.width -image2.size.width * 0.5 , image1.size.height - image2.size.height *0.5, image2.size.width * 0.5, image2.size.height *0.5)];
        watermarkImageView = UIGraphicsGetImageFromCurrentImageContext();
        // 结束上下文
        UIGraphicsEndImageContext();
    });
    return watermarkImageView;
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
