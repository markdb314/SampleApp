#import "MBDrawingTestViewController.h"

@interface MBDrawingTestViewController ()

@property (weak, nonatomic) IBOutlet UIButton *animatedButton;

@end

@implementation MBDrawingTestViewController

- (id)init {
    self = [super initWithNibName:@"DrawingTest" bundle:nil];
    if (self) {
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSAssert(NO, @"Initialization should be done with the init method");
    return nil;
}

- (void)viewDidLoad {
    [self framesTest];
//    [self loadBasicLayerAndAnimationTest];
}

- (void)framesTest {
    UIView* orangeView = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 50, 50)];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
}

- (void)loadBasicLayerAndAnimationTest {
    CALayer* lay1 = [CALayer new];
    lay1.frame = CGRectMake(113, 111, 132, 194);
    lay1.backgroundColor = [[UIColor purpleColor] CGColor];
    [self.view.layer addSublayer:lay1];
    
    CALayer* lay2 = [CALayer new];
    lay2.frame = CGRectMake(41, 56, 132, 194);
    lay2.backgroundColor = [[UIColor greenColor] CGColor];
    [lay1 addSublayer:lay2];
    
    UIImageView* iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Headphones"]];
    CGRect r = iv.frame;
    r.origin = CGPointMake(180, 180);
    iv.frame = r;
    [self.view addSubview:iv];
    iv.layer.zPosition = 1;
    
    CALayer* lay3 = [CALayer new];
    lay3.backgroundColor = [[UIColor redColor] CGColor];
    lay3.frame = CGRectMake(43, 197, 160, 230);
    [self.view.layer addSublayer:lay3];
    
    // add in an animated red circle using UIImage animation
    NSMutableArray* arr = [NSMutableArray array];
    float w = 50;
    for (int i = 0; i< 6; i++) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, w), NO, 0);
        CGContextRef con = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
        CGContextAddEllipseInRect(con, CGRectMake(0 + i, 0 + i, w - i*2, w - i*2));
        CGContextFillPath(con);
        UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [arr addObject:im];
    }
    UIImage* im = [UIImage animatedImageWithImages:arr duration:0.5];
    [self.animatedButton setImage:im forState:UIControlStateNormal];
    
    // this will slowly change the background color
    [UIView animateWithDuration:10 animations:^{
        self.view.backgroundColor = [UIColor yellowColor];
    }];
}

@end
