//
//  LQWaterMark.m
//  LQWaterMark
//
//  Created by v大夫 on 16/7/14.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "LQWaterMark.h"
#import "UIImageView+WebCache.h"


@implementation LQWaterMark

static UIImageView *tempImageView;

/**
 *  使用sawebImage 获取网络图片并将本地的图片进行 水印设置
 *
 *  @param watermarkUrl   传入图片URL
 *  @param waterMarkImage 水印的图片
 *  @param block          图片下载完回调
 */
+ (void)watermarkWithURL:(NSURL*)watermarkUrl andWatermarkImage:(UIImage*)waterMarkImage andBlock:(void (^)(UIImage*))block
{
    tempImageView = [[UIImageView alloc]init];
    [tempImageView sd_setImageWithURL:watermarkUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 开始上下文
        UIGraphicsBeginImageContextWithOptions(image.size, YES, 0.0);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [waterMarkImage drawInRect:CGRectMake(image.size.width -waterMarkImage.size.width, image.size.height - waterMarkImage.size.height, waterMarkImage.size.width , waterMarkImage.size.height)];
         UIImage *lastImage = UIGraphicsGetImageFromCurrentImageContext();
       
        // 结束上下文
        UIGraphicsEndImageContext();
         block(lastImage);
        
    }];

}



/**
 *  使用队列组给图片打水印
 *
 *  @param watermarkUrl 图片的地址URL
 *  @param watermark    水印图片的地址URL
 *  @param block        图片下载完回调
 */
+ (void)watermarkWithURL:(NSURL*)watermarkUrl andWatermarkURL:(NSURL*)watermark andBlock:(void (^)(UIImage*))block
{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    __block UIImage *image1;
    __block UIImage *image2;
    __block UIImage *watermarkImageView;
    dispatch_group_async(group, queue, ^{
        NSData *data1 = [NSData dataWithContentsOfURL:watermarkUrl];
        image1 = [UIImage imageWithData:data1];
    });
    
    dispatch_group_async(group, queue, ^{
        NSData *data2 = [NSData dataWithContentsOfURL:watermark];
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
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            block(watermarkImageView);
        });
        
    });
}
@end
