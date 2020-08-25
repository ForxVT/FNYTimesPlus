#import "FNYRootListController.h"
#import "FNYTimesPlusPref.h"
#import <dlfcn.h>

static int (*BKSTerminateApplicationForReasonAndReportWithDescription)(NSString *bundleID, int reasonID, bool report, NSString *description);

@implementation FNYRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)viewDidLoad {
    [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:fnyLocalizedString(@"APPLY") style:UIBarButtonItemStylePlain target:self action:@selector(apply)]];

    [super viewDidLoad];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
    	return 20.f;
    }

    return [super tableView:tableView heightForHeaderInSection:section];
}

- (void)apply {
	void *bk = dlopen("/System/Library/PrivateFrameworks/BackBoardServices.framework/BackBoardServices", RTLD_LAZY);

	if (bk) {
		BKSTerminateApplicationForReasonAndReportWithDescription = (int (*)(NSString*, int, bool, NSString*))dlsym(bk, "BKSTerminateApplicationForReasonAndReportWithDescription");
	}

	if (BKSTerminateApplicationForReasonAndReportWithDescription) {
		BKSTerminateApplicationForReasonAndReportWithDescription(@"com.nytimes.NYTimes", 1, 0, @"[FNYTimesPlus] Killed NYTimes to reload preferences.");
	}
}

- (void)openSourceCodePage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ForxVT/FNYTimesPlus"] options:@{} completionHandler:nil];
}

- (void)openTwitterPage
{
	if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=ForxVT"] options:@{} completionHandler:nil];
	} else {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/ForxVT"] options:@{} completionHandler:nil];
	}
}

- (void)openRedditPage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.reddit.com/user/ForxVT"] options:@{} completionHandler:nil];
}

- (void)openGithubPage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ForxVT"] options:@{} completionHandler:nil];
}

- (void)openPaypalPage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/hkindel"] options:@{} completionHandler:nil];
}

@end