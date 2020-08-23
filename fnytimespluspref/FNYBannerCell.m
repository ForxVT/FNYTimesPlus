#import "FNYBannerCell.h"
#import "UIImage+CircleMask.h"

@implementation FNYBannerCell
	- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
		self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fnyHeaderCell" specifier:specifier];

		if (self) {
			_unmaskedImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle bundleWithPath:@"/Library/PreferenceBundles/FNYTimesPlusPref.bundle"] pathForResource:@"iconlarge" ofType:@"png"]];
			UIImage *maskedImage = [UIImage roundedRectImageFromImage:_unmaskedImage size:CGSizeMake(100, 100) withCornerRadius:18];
			_bannerView = [[UIImageView alloc] initWithImage:maskedImage];
			_bannerView.frame = CGRectMake(0, 0, self.bounds.size.width, 100);
			[_bannerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
			_bannerView.contentMode = UIViewContentModeCenter;

			[self addSubview:_bannerView];
		}

		return self;
	}

	- (CGFloat)preferredHeightForWidth:(CGFloat)width {
		return 115.f;
	}

@end
