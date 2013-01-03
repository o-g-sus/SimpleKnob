//
//  KnobController.m
//
//  Created by Oliver Greschke on 27.12.12.
//  Copyright (c) 2012 Oliver Greschke. All rights reserved.
//

#import "KnobController.h"
#import "KnobView.h" 

@implementation KnobController

@synthesize knobView;
@synthesize valueLabel;
@synthesize describeLabel;
@synthesize initValue;
@synthesize value;
@synthesize multiplicator;
@synthesize roundToInt;


- (id) initWithFrame: (CGRect) frame
{
    if (self = [super initWithFrame:frame])
    {
        //NSLog(@"initWithFrame");
        [self setupButton];
    }
    return self;
}

- (void) awakeFromNib
{
    //NSLog(@"awakeFromNib");
    [super awakeFromNib];
    [self setupButton];
}


- (void) setupButton
{
    // setup vars
    if (multiplicator==0) multiplicator = 1;
    previousRotation = 0.5/multiplicator;
    
    // add gesture rec
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [pan setDelegate:self];
    [self addGestureRecognizer:pan];
    
    // add knob view
    self.knobView = [[KnobView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.knobView];
    self.knobView.backgroundColor = [UIColor clearColor];
    
    // add value label
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.knobView.frame.size.height, self.frame.size.width, 20)];
    self.valueLabel.font = [UIFont systemFontOfSize:12];
    self.valueLabel.textAlignment = NSTextAlignmentCenter;
    self.valueLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.valueLabel];
    
    // add headline label
    self.describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -20, self.frame.size.width, 20)];
    self.describeLabel.text = @"description";
    self.describeLabel.font = [UIFont systemFontOfSize:10];
    self.describeLabel.textAlignment = NSTextAlignmentCenter;
    self.describeLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.describeLabel];
    
}


- (void) handlePan: (UIPanGestureRecognizer *) uigr
{    
    CGPoint translation = [uigr translationInView:self.superview];
	
    float rotNumber = previousRotation - (translation.y*0.01) ;
    if (rotNumber>+1) rotNumber = +1;
    if (rotNumber<-0) rotNumber = -0;
    
    NSNumber *nsValue = [NSNumber numberWithFloat:rotNumber];
    [self setKnobToValue:nsValue];
    
    if ([uigr  state] == UIGestureRecognizerStateEnded) {        
        previousRotation = rotNumber;
    }
}

- (void) setKnobToValue:(NSNumber*) value_
{
    //NSLog(@"setKnobToValue %@",value);        
    self.value = value_.floatValue * multiplicator;
    NSString * valueText = [NSString stringWithFormat:@"%.2f", self.value]; 
    if (roundToInt) {
        self.value = roundf(self.value);
        valueText = [NSString stringWithFormat:@"%.0f", self.value];
    }
    [self.delegate newValue:self.value fromSender:self];
    self.valueLabel.text = valueText;
    self.knobView.transform = CGAffineTransformMakeRotation((value_.floatValue-.5) * 1.6 * M_PI);
}

- (void) setInitValue:(float) value_
{
    previousRotation = value_/multiplicator;
    // TODO make without delay !!
    [self performSelector:@selector(setKnobToValue:) withObject:[NSNumber numberWithFloat:value_/multiplicator] afterDelay:0.01];
}




@end
