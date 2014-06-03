#import "MBInitialScreenViewController.h"

@interface MBInitialScreenViewController ()

@end

@implementation MBInitialScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)theButtonWasPressed:(id)sender {
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"hello" message:@"why did you press that?" delegate:nil cancelButtonTitle:@"oh no!" otherButtonTitles:nil];
    [alertView show];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerDone) userInfo:nil repeats:YES];
}

- (void)timerDone {
    if (self.view.superview) {
        [self.view removeFromSuperview];
    } else {
        [[[UIApplication sharedApplication] keyWindow] addSubview:self.view];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
