//
//  KnobView.h
//
//  Created by Oliver Greschke on 29.12.12.
//  Copyright (c) 2012 Oliver Greschke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnobView : UIButton

@property (nonatomic, strong) UIColor * buttonBGColor;
@property (nonatomic, strong) UIColor * buttonBGHighlightColor;
@property (nonatomic, strong) UIColor * buttonLinesColor;

- (void) setButtonHighlighted:(BOOL) highl;

@end
