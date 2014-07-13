//
//  DisplayView.m
//  LineAnimation
//
//  Created by Darshan on 13/07/14.
//  Copyright (c) 2014 Darshan. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)didMoveToSuperview
{
    if ([self superview])
    {
        
        alayer = [[LineAnimationLayer alloc] init];
        alayer.frame = self.frame;
        [self.layer addSublayer:alayer];
        
    }
}
@end
