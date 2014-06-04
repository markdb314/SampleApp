#import "MBLayoutTestViewController.h"

@interface MBLayoutTestViewController ()

@end

@implementation MBLayoutTestViewController

- (id)init {
    self = [super initWithNibName:@"LayoutTest" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSAssert(NO, @"Initialization should be done with the init method");
    return nil;
}

@end
