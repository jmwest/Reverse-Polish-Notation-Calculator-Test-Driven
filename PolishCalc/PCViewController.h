//
//  PCViewController.h
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"


@interface PCViewController : UIViewController

@property (strong, nonatomic) NSString *currentOperand;
@property (strong, nonatomic) NSString *operandPressed;
@property (strong, nonatomic) NSString *operationPressed;
@property (strong, nonatomic) Calculator *calc;

- (id)init;

- (IBAction)operandWasPressed:(UIButton *)sender;
- (BOOL)operationWasPressed:(UIButton *)sender;
- (BOOL)enterWasPressed:(UIButton *)sender;
- (IBAction)clearWasPressed:(UIButton *)sender;
-(BOOL)respondsToSelector:(SEL)aSelector;

- (void)initializeButtons;

@end
