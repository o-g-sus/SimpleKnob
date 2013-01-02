//
//  ViewController.m
//  SimpleKnob
//
//  Created by Oliver Greschke on 02.01.13.
//  Copyright (c) 2013 Oliver Greschke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize knob1,knob2,knob3, knobVolume,knobSteps;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // add Knobs by scipt
    knobVolume = [[KnobController alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    [self.view addSubview:knobVolume];
    CGRect frame = knobVolume.frame;
    frame.origin.x = 60;
    frame.origin.y = 300;
    knobVolume.frame = frame;
    knobVolume.initValue = 0.3;
    knobVolume.describeLabel.text = @"Volume";
    
    knobSteps = [[KnobController alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    [self.view addSubview:knobSteps];
    frame = knobSteps.frame;
    frame.origin.x = 200;
    frame.origin.y = 300;
    knobSteps.frame = frame;
    knobSteps.multiplicator = 16;
    knobSteps.roundToInt=YES;    
    knobSteps.initValue = 4;
    knobSteps.describeLabel.text = @"Steps";
    
    knobVolume.delegate = self;
    knobSteps.delegate = self;
    
    // change properties of knobs generated via IB
    knob1.initValue = 0;
    knob3.initValue = 1;
    knob1.describeLabel.hidden = YES;
    knob3.describeLabel.hidden = YES;
    knob2.valueLabel.hidden = YES;
}

- (void) newValue:(float)newVal fromSender:(id)sender
{
    NSLog(@"newVal %f", newVal);
}

@end
