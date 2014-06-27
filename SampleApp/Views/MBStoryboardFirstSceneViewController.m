#import "MBStoryboardFirstSceneViewController.h"

@interface MBStoryboardFirstSceneViewController ()

@end

@implementation MBStoryboardFirstSceneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)dismissPresentedViewButtonPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
