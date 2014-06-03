#import "MBCodeOnlyViewController.h"

@interface MBCodeOnlyViewController ()

@end

@implementation MBCodeOnlyViewController

- (id)initCodeOnly {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSAssert(NO, @"shouldn't have called this!");
    return nil;
}

// this is the method to override when you don't have a nib and want to do it via code
- (void)loadView {
    UIView* baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    UIView* blueBlock = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    blueBlock.backgroundColor = [UIColor blueColor];
    
    [baseView addSubview:blueBlock];
    
    self.view = baseView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
