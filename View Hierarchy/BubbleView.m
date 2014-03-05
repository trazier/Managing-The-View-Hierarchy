//
//  BubbleView.m
//  View Hierarchy
//
//  Created by Frazier Moore on 3/4/14.
//  Copyright (c) 2014 Frazier Moore. All rights reserved.
//

#import "BubbleView.h"
#import "UIColor+RandomColor.h"

@implementation BubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    // set bubble color
    self.backgroundColor = [UIColor generateRandomColor];
    // clip to circle
    self.layer.cornerRadius = self.frame.size.height/2;
    self.clipsToBounds = YES;
    
    if (self) {
        
        // create smaller bubbles
        UIView *innerBubble1 = [[UIView alloc] initWithFrame:CGRectMake(self.randomValue, self.randomValue, 20, 20)];
        UIView *innerBubble2 = [[UIView alloc] initWithFrame:CGRectMake(self.randomValue, self.randomValue, 20, 20)];
        [self formatBubble:innerBubble1];
        [self formatBubble:innerBubble2];
        
        
        // set up animation
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[innerBubble1,innerBubble2]];
        
        [_animator addBehavior:gravity];
        
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[innerBubble1,innerBubble2]];
        
        [collision setTranslatesReferenceBoundsIntoBoundary:YES];
        
        [_animator addBehavior:collision];

    }
    return self;
}

- (void) formatBubble:(UIView *) bubbleName
{
    bubbleName.layer.cornerRadius = bubbleName.frame.size.height/2;
    bubbleName.backgroundColor = [UIColor generateRandomColor];
    bubbleName.clipsToBounds = YES;
    [self addSubview:bubbleName];
}

//random value to initialize smaller bubbles
- (CGFloat) randomValue
{
    CGFloat value = (float)arc4random_uniform(self.frame.size.height);
    return value;
}

@end
