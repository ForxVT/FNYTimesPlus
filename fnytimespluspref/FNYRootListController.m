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

@end