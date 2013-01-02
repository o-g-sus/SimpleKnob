//
//  KnobController.h
//
//  Created by Oliver Greschke on 27.12.12.
//  Copyright (c) 2012 Oliver Greschke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class KnobView;


@protocol KnobControllerDelegate <NSObject>
@optional
- (void) newValue:(float)newVal fromSender:(id)sender;
@end


@interface KnobController : UIControl <UIGestureRecognizerDelegate, NSCoding> {
    @private
        float previousRotation;
        float knobValue;
}


@property (nonatomic, strong) KnobView * knobView;
@property (nonatomic, strong) UILabel * valueLabel;
@property (nonatomic, strong) UILabel * describeLabel;

@property (nonatomic) float initValue;
@property (nonatomic) float value;
@property (nonatomic) float multiplicator;
@property (nonatomic) BOOL roundToInt;

@property (nonatomic, assign) id<KnobControllerDelegate> delegate;


@end
