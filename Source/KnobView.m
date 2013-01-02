//
//  KnobView.m
//
//  Created by Oliver Greschke on 29.12.12.
//  Copyright (c) 2012 Oliver Greschke. All rights reserved.
//

#import "KnobView.h"

@implementation KnobView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{    
    //NSLog(@"drawRect");
    // draw circle
    int dim = self.frame.size.width;
    
    UIColor *color          = [UIColor grayColor];
    CGContextRef context    = UIGraphicsGetCurrentContext();
    [color set];
    
    CGContextFillEllipseInRect(context, CGRectMake (0,0,dim,dim));
    UIGraphicsEndImageContext();
    
    // daw line    
    CGColorRef col = [UIColor blackColor].CGColor;    
    CGContextSetStrokeColorWithColor(context, col );
    CGContextSetLineWidth(context, 4.0);
    CGContextMoveToPoint(context, dim/2, dim/2);
    CGContextAddLineToPoint(context, dim/2, 0);
    CGContextStrokePath(context);    
}


@end
