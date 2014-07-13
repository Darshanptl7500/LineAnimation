//
//  LineAnimationLayer.m
//  LineAnimation
//
//  Created by Darshan on 13/07/14.
//  Copyright (c) 2014 Darshan. All rights reserved.
//

#import "LineAnimationLayer.h"
#import <QuartzCore/QuartzCore.h>
@implementation LineAnimationLayer

static bool isRunning;
static CGPoint lastPoint = {0, 0};
- (id)init
{
    self = [super init];
    if (self)
    {
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)] ;
        [self setNeedsDisplayOnBoundsChange:YES];
    }
    
    return self;
}


- (void)drawInContext:(CGContextRef)ctx
{
    if (!isRunning)
    {
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        isRunning = YES;
        return;
    }
    
    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextSetLineWidth(ctx, 10.0);
    
    CGRect rect = CGContextGetClipBoundingBox(ctx);
    
    CGContextMoveToPoint(ctx, 0, 0);
    lastPoint.x += 1;
    //lastPoint.y += 1;
    
    CGContextAddLineToPoint(ctx, lastPoint.x, lastPoint.y);
    CGContextStrokePath(ctx);
    
    if (lastPoint.x == rect.size.width)
    {
        [displayLink invalidate];
        isRunning = NO;
    }
}

@end
