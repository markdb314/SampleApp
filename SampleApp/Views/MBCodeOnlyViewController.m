#import "MBCodeOnlyViewController.h"

@interface MBCodeOnlyViewController ()

@end

@implementation MBCodeOnlyViewController {
    UIView* _outerView;
    UIView* _innerView;
    UILabel* _outerViewLabel;
    UILabel* _innerViewLabel;
}

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
    
    _outerView = [[UIView alloc] initWithFrame:CGRectMake( 113, 111, 132, 194)];
    _outerView.backgroundColor = [UIColor colorWithRed: 1 green:.4 blue: 1 alpha: 1];
    _innerView = [[UIView alloc] initWithFrame:CGRectInset(_outerView.bounds, 10, 10)];
    _innerView.backgroundColor = [UIColor colorWithRed:.5 green: 1 blue: 0 alpha: 1];
    [baseView addSubview: _outerView];
    [_outerView addSubview: _innerView];
    
    // stick a button at the bottom
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(10, 310, 300, 50)];
    [button setTitle:@"Change view properties" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(changeViewProperties:) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:button];
    
    // put two labels below that
    _outerViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 300, 50)];
    _outerViewLabel.numberOfLines = 2;
    _outerViewLabel.adjustsFontSizeToFitWidth = YES;
    
    _innerViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 410, 300, 50)];
    _innerViewLabel.numberOfLines = 2;
    _innerViewLabel.adjustsFontSizeToFitWidth = YES;
    
    [self displayViewInfo];
    [baseView addSubview:_outerViewLabel];
    [baseView addSubview:_innerViewLabel];
    
    self.view = baseView;
}

// make different adjustments to the frame, bounds, and center of the views to see how they respond
- (IBAction)changeViewProperties:(id)sender {
    // adjust the width of the bounds of the outer view
//    CGRect bounds = _outerView.bounds;
//    bounds.size.width += 10;
//    bounds.size.height += 10;
//    [self->_outerView setBounds:bounds];

    // adjust the origin of the bounds of the outer view
    CGRect bounds = _outerView.bounds;
    bounds.origin.x += 10;
    bounds.origin.y += 10;
    [self->_outerView setBounds:bounds];

    // adjust the origin of the bounds to something negative
//    CGRect bounds = _outerView.bounds;
//    bounds.origin.x -= 10;
//    bounds.origin.y -= 10;
//    [self->_outerView setBounds:bounds];
    
    
    // adjust the center of the inner view
//    CGPoint center = _innerView.center;
//    center.x += 10;
//    center.y += 10;
//    [_innerView setCenter:center];
    
    [self displayViewInfo];
}

- (void)displayViewInfo {
    _outerViewLabel.text = [NSString stringWithFormat:@"outer view:\ncenter(%.00f, %.00f) bounds(%.00f, %.00f, %.00f, %.00f) frame(%.00f, %.00f, %.00f, %.00f)",
                            _outerView.center.x, _outerView.center.y,
                            _outerView.bounds.origin.x, _outerView.bounds.origin.y, _outerView.bounds.size.width, _outerView.bounds.size.height,
                            _outerView.frame.origin.x, _outerView.frame.origin.y, _outerView.frame.size.width, _outerView.frame.size.height];
    _innerViewLabel.text = [NSString stringWithFormat:@"inner view:\ncenter(%.00f, %.00f) bounds(%.00f, %.00f, %.00f, %.00f) frame(%.00f, %.00f, %.00f, %.00f)",
                            _innerView.center.x, _innerView.center.y,
                            _innerView.bounds.origin.x, _innerView.bounds.origin.y, _innerView.bounds.size.width, _innerView.bounds.size.height,
                            _innerView.frame.origin.x, _innerView.frame.origin.y, _innerView.frame.size.width, _innerView.frame.size.height];
}

@end
