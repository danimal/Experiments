//
//  ViewController.h
//  twister
//
//  Created by Dan Weeks on 2012-05-20.
//  Copyright (c) 2012 Dan Weeks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong, readwrite) NSMutableArray *viewArray;

- (IBAction)turnViews:(id)sender;
- (void)rotateView:(UIView *)theView duration:(NSTimeInterval)duration curve:(NSString *)curve degrees:(CGFloat)degrees;
- (void)setupStackedViews;

@end
