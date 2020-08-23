#import <UIKit/UIKit.h>

@interface UIImage (CircleMask)

+ (UIImage *)roundedRectImageFromImage:(UIImage *)image size:(CGSize)imageSize withCornerRadius:(float)cornerRadius;

@end
