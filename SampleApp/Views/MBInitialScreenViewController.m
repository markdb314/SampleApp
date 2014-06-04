#import "MBInitialScreenViewController.h"
#import "MBCodeOnlyViewController.h"
#import "MBLayoutTestViewController.h"

@interface MBInitialScreenViewController ()

@end

@implementation MBInitialScreenViewController {
    UIView* redSquare;
}

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

- (IBAction)toggleRedSquare:(id)sender {
    if (!self->redSquare) {
        self->redSquare = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
        self->redSquare.backgroundColor = [UIColor redColor];
    }
    
    if (![self->redSquare isDescendantOfView:self.view]) {
        [self.view addSubview:self->redSquare];
    } else {
        [self->redSquare removeFromSuperview];
    }
}

- (IBAction)addRemoveSubview:(id)sender {
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

- (IBAction)navToCodeOnly:(id)sender {
    MBCodeOnlyViewController* vc = [[MBCodeOnlyViewController alloc] initCodeOnly];
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)navToLayoutTest:(id)sender {
    MBLayoutTestViewController* vc = [[MBLayoutTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
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
