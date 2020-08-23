#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#define kIdentifier @"com.forx.nytimesplus"
#define kSettingsChangedNotification (CFStringRef)@"com.forx.nytimesplus/preferences.changed"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.forx.nytimespluspref.plist"

@interface NSUserDefaults (Tweak_Category)

- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;

@end
