//
//  VHViewController.m
//  View Hierarchy
//
//  Created by Frazier Moore on 3/4/14.
//  Copyright (c) 2014 Frazier Moore. All rights reserved.
//

#import "VHViewController.h"
#import "BubbleView.h"

@interface VHViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation VHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    BubbleView *bubble = [[BubbleView alloc] initWithFrame:CGRectMake(self.randomXValue, self.randomYValue, 120, 120)];
    BubbleView *bubble2 = [[BubbleView alloc] initWithFrame:CGRectMake(self.randomXValue, self.randomYValue, 120, 120)];
    [self.view addSubview:bubble];
    [self.view addSubview:bubble2];
    
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[bubble,bubble2]];
    
    [_animator addBehavior:gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[bubble,bubble2]];
    
    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
    
    [_animator addBehavior:collision];
    
}

- (CGFloat) randomXValue
{
    CGFloat value = (float)arc4random_uniform(self.view.frame.size.width);
    return value;
}

- (CGFloat) randomYValue
{
    CGFloat value = (float)arc4random_uniform(self.view.frame.size.height);
    return value;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
