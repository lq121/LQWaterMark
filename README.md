# LQWaterMark
结合sdwebImage 框架对网络图片打水印
#使用前提：下载​SDWebImage
#### 使用sawebImage 获取网络图片并将本地的图片进行 水印设置
~~~
/*
 *  使用sawebImage 获取网络图片并将本地的图片进行 水印设置
 *  @param watermarkUrl   传入图片URL
 *  @param waterMarkImage 水印的图片
 *  @param block          图片下载完回调
 */
 ~~~ 
 + (void)watermarkWithURL:(NSURL*)watermarkUrl andWatermarkImage:(UIImage*)waterMarkImage andBlock:(void (^)(UIImage*))block;


####  使用队列组给图片打水印
~~~
/*
 *  使用队列组给图片打水印
 *  @param watermarkUrl 图片的地址URL
 *  @param watermark    水印图片的地址URL
 *  @param block        图片下载完回调
 */
 ~~~
+ (void)watermarkWithURL:(NSURL*)watermarkUrl andWatermarkURL:(NSURL*)watermark andBlock:(void (^)(UIImage*))block;
