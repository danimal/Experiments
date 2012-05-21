//
//  ViewController.m
//  twister
//
//  Created by Dan Weeks on 2012-05-20.
//  Copyright (c) 2012 Dan Weeks. All rights reserved.
//

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize viewArray=_viewArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewArray = [NSMutableArray new];
    [self.view setBackgroundColor:[UIColor grayColor]];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupStackedViews];
    
    for (UIView *s in self.viewArray) {
        [self.view addSubview:s];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (void)rotateView:(UIView *)theView duration:(NSTimeInterval)duration curve:(NSString *)curve degrees:(CGFloat)degrees
{ 
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.fromValue = [NSNumber numberWithFloat:0];
    rotate.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(degrees)];
    rotate.duration = duration; // seconds
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:curve];
    [theView.layer addAnimation:rotate forKey:nil]; // "key" is optional
}

- (IBAction)turnViews:(id)sender
{
    for (NSUInteger idx = 0; idx < [self.viewArray count]; idx++) {
        double degrees = -90.0 * ((idx + 1));
        [self rotateView:[self.viewArray objectAtIndex:idx] duration:2.0 curve:kCAMediaTimingFunctionEaseInEaseOut degrees:degrees];
    }
}

- (void)setupStackedViews
{
    double side = 512.0;
    UIColor *black = [UIColor blackColor];
    UIColor *white = [UIColor whiteColor];
    int count = 0;
    
    while (side >= 30.0) {
        UIView *aView = [UIView new];
        
        if ((count % 2) != 0) {
            // odd views, black and smaller inset
            [aView setBackgroundColor:black];
        } else {
            // even views, white and larger inset
            [aView setBackgroundColor:white];
        }
        double theValue = 15.0 * count;
        [aView setFrame:CGRectMake((self.view.frame.size.width / 2) - 256.0 + theValue,
                                   (self.view.frame.size.height / 2) - 256.0 + theValue,
                                   side,
                                   side)];
        [[self viewArray] addObject:aView];
        
        count++;
        side = 512.0 - (30.0 * count);
    }
}

@end
