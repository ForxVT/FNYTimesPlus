#import "FNYTimesPlusPref.h"

NSString *fnyLocalizedString(NSString *string)
{
    return [[NSBundle bundleWithPath:kPreferenceBundlePath] localizedStringForKey:string value:string table:nil];
}