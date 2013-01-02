//
//  ViewController.h
//  SimpleKnob
//
//  Created by Oliver Greschke on 02.01.13.
//  Copyright (c) 2013 Oliver Greschke. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KnobController.h"

@interface ViewController : UIViewController <KnobControllerDelegate>


@property (strong, nonatomic) KnobController *knobVolume;
@property (strong, nonatomic) KnobController *knobSteps;

@property (weak, nonatomic) IBOutlet KnobController *knob1;
@property (weak, nonatomic) IBOutlet KnobController *knob2;
@property (weak, nonatomic) IBOutlet KnobController *knob3;

@end
