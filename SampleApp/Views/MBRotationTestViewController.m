#import "MBRotationTestViewController.h"
#import "MBDrawingTestViewController.h"

@interface MBRotationTestViewController ()

@end

@implementation MBRotationTestViewController {
    UIView* _redSquare;
}

- (id)init {
    self = [super initWithNibName:@"RotationTest" bundle:nil];
    if (self) {
        self.title = @"Rotation Test";
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSAssert(NO, @"Initialization should be done with the init method");
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIView*)blackRect {
    if (!self->_blackRect) {
        if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation))
            return nil;
        CGRect f = self.view.bounds;
        f.size.width /= 3.0;
        f.origin.x = -f.size.width;
        UIView* br = [[UIView alloc] initWithFrame:f];
        br.backgroundColor = [UIColor blackColor];
        self.blackRect = br;
    }
    return self->_blackRect;
}

- (IBAction)animateButtonPressed:(id)sender {
    [UIView animateWithDuration:2.0 animations:^{
        // this was a test to see if i could add a view and change it's properties, and have those
        // property changes be animated
        self->_redSquare = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
        self->_redSquare.backgroundColor = [UIColor redColor];
        [self.view addSubview:self->_redSquare];

        CGPoint p = self->_redSquare.center;
        p.x = 150;
        self->_redSquare.center = p;
    }];
}

- (IBAction)presentViewButtonPressed:(id)sender {
    MBDrawingTestViewController* vc = [MBDrawingTestViewController new];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)io duration:(NSTimeInterval)duration {
    UIView* v = self.blackRect;
    if (UIInterfaceOrientationIsLandscape(io)) {
        if (!v.superview) {
            [self.view addSubview:v];
            CGRect f = v.frame;
            f.origin.x = 0;
            v.frame = f;
        }
    } else {
        if (v.superview) {
            CGRect f = v.frame;
            f.origin.x -= f.size.width;
            v.frame = f;
        }
    }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)io {
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation))
        [self.blackRect removeFromSuperview];
}

@end
