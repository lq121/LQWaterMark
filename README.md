# LQWaterMark
结合sdwebImage 框架对网络图片打水印
#使用前提：下载​SDWebImage

# 使用sawebImage 获取网络图片并将本地的图片进行 水印设置
/*
 * 使用sawebImage 获取网络图片并将本地的图片进行 水印设置
 * urlStr 传入图片地址
 * waterMarkImage 水印的图片名
 */

- (UIImage*)watermarkWithURLString:(NSString*)urlStr andWatermarkImage:(NSString*)waterMarkImage

# 使用sawebImage 获取网络图片并将本地的图片进行 水印设置
/*
 * 使用队列组给图片打水印
 * image1String 图片的地址
 * image2String 水印图片的地址
 */
- (UIImage*)watermarkWithimage1:(NSString*)image1String andImage2:(NSString*)image2String
