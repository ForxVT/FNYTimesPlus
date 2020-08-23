#import <Foundation/Foundation.h>

#define kPreferenceBundlePath @"/Library/PreferenceBundles/FNYTimesPlusPref.bundle"

NSString *fnyLocalizedString(NSString *string)
{
    return [[NSBundle bundleWithPath:kPreferenceBundlePath] localizedStringForKey:string value:string table:nil];
}