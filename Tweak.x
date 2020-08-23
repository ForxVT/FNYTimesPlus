#import "Tweak.h"

static BOOL _settingsGeneralEnable = YES;
static BOOL _settingsArticleAds = YES;
static BOOL _settingsArticleNews = YES;
static void *_observer = NULL;
NSDictionary *_prefs = nil;

static void reloadPreferences() {
	_prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
}

static BOOL boolValueForKey(NSString *key, BOOL defaultValue) {
	return (_prefs && [_prefs objectForKey:key]) ? [[_prefs objectForKey:key] boolValue] : defaultValue;
}

static void preferencesChanged() {
	CFPreferencesAppSynchronize((CFStringRef)kIdentifier);
	reloadPreferences();

	_settingsGeneralEnable = boolValueForKey(@"GENERAL_ENABLE", YES);
	_settingsArticleAds = boolValueForKey(@"ARTICLES_ADVERTISEMENTS", YES);
	_settingsArticleNews = boolValueForKey(@"ARTICLE_NEWSLETTERS", YES);

	NSLog(@"[FNYTimesPlus] _settingsGeneralEnable = %d", _settingsGeneralEnable);
	NSLog(@"[FNYTimesPlus] _settingsArticleAds = %d", _settingsArticleAds);
	NSLog(@"[FNYTimesPlus] _settingsArticleNews = %d", _settingsArticleNews);
}

%hook Newsreader_ArticleViewController

	- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
		if (_settingsArticleAds) {
			NSString *adsRemover = @"var ads=document.getElementsByClassName('ad-wrapper');Array.from(ads).forEach(e=>{e.remove()});";
			[webView evaluateJavaScript:adsRemover completionHandler:nil];
		}

		if (_settingsArticleNews) {
			NSString *newsletterRemover = @"var article=document.getElementsByTagName('article')[0];Array.from(article.children).forEach(e=>{e.className.includes('signupClass')&&(e.previousSibling.remove(),e.remove())});";
			[webView evaluateJavaScript:newsletterRemover completionHandler:nil];
		}

		%orig;
	}

%end

%ctor {
	preferencesChanged();

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), &_observer, (CFNotificationCallback)preferencesChanged, kSettingsChangedNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

	if (!_settingsGeneralEnable) {
		return;
	}

	%init(Newsreader_ArticleViewController = objc_getClass("Newsreader.ArticleViewController"));
}
