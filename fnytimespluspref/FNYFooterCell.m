#import "FNYFooterCell.h"
#import "FNYTimesPlusPref.h"

@implementation FNYFooterCell
	- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
		self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fnyFooterCell" specifier:specifier];

		if (self) {
			_copyrightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 42)];
			_copyrightLabel.text = [NSString stringWithFormat:@"\u00A9 Hugo Kindel 2020 - NYTimes+ 1.0.0\n%@ \u00A9 The New York Times Company 2020", fnyLocalizedString(@"NYTIMES_CP")];
			_copyrightLabel.font = [UIFont systemFontOfSize:12.0f];
			_copyrightLabel.lineBreakMode = NSLineBreakByWordWrapping;
			_copyrightLabel.numberOfLines = 2;
			[_copyrightLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
			_copyrightLabel.textAlignment =  NSTextAlignmentCenter;
			
			[self addSubview:_copyrightLabel];
		}

		return self;
	}

	- (CGFloat)preferredHeightForWidth:(CGFloat)width {
		return 40.f;
	}

@end
