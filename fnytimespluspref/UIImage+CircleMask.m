#import "UIImage+CircleMask.h"

@implementation UIImage (CircleMask)

+ (UIImage*)roundedRectImageFromImage:(UIImage *)image size:(CGSize)imageSize withCornerRadius:(float)cornerRadius
{
	UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);

	CGRect bounds = (CGRect){ CGPointZero,imageSize };

	[[UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:cornerRadius] addClip];
	[image drawInRect:bounds];

	UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();

	UIGraphicsEndImageContext();

	return finalImage;
}

@end
