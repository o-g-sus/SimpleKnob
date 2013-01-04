//
//  KnobView.m
//
//  Created by Oliver Greschke on 29.12.12.
//  Copyright (c) 2012 Oliver Greschke. All rights reserved.
//

#import "KnobView.h"

@implementation KnobView

@synthesize buttonLinesColor, buttonBGColor, buttonBGHighlightColor;

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
    UIColor *strokeColor        = buttonLinesColor       ? buttonLinesColor       : [UIColor blackColor];
    UIColor *bgColor            = buttonBGColor          ? buttonBGColor          : [UIColor lightGrayColor];
    UIColor *bgHighlightColor   = buttonBGHighlightColor ? buttonBGHighlightColor : [UIColor grayColor];
    
    CGContextRef context        = UIGraphicsGetCurrentContext();
    
    float dim = self.bounds.size.width;
    CGRect rec_dim = CGRectMake (0,0,dim,dim);
    CGRect rec = CGRectInset(rec_dim, 1.0, 1.0);
    CGRect innerStrokeRectangle = CGRectInset(rec, 1.0, 1.0);
    
    // Filling
    // state highlighted
    if (self.state & UIControlStateHighlighted)
    {
        [bgHighlightColor set];
        CGContextFillEllipseInRect(context, rec);
    }
    // state normal
    else
    {
        [bgColor set];
        CGContextFillEllipseInRect(context, rec);
    }

    // Filling stoke
    [strokeColor set];
    CGContextSetLineWidth(context, 2);
    CGContextStrokeEllipseInRect(context, innerStrokeRectangle);    
    
    // Draw locator line    
    CGColorRef col = strokeColor.CGColor;
    CGContextSetStrokeColorWithColor(context, col );
    CGContextSetLineWidth(context, 4.0);
    CGContextMoveToPoint(context, dim/2, dim/2);
    CGContextAddLineToPoint(context, dim/2, 1.0);
    CGContextStrokePath(context);    
}


- (void) setButtonHighlighted:(BOOL) highl {
    [super setHighlighted:highl];
    [self setNeedsLayout];
    [self setNeedsDisplay];
}


// Overwrite super property hghlighted
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];    
    [self setNeedsLayout];
    [self setNeedsDisplay];
}




@end
