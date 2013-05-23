//
//  PCViewController.h
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class Calculator;

@interface PCViewController : UIViewController

@property (strong, nonatomic) NSString *currentOperand;
@property (strong, nonatomic) NSString *operandPressed;
@property (strong, nonatomic) NSString *operationPressed;
@property (strong, nonatomic) Calculator *calc;

- (IBAction)operandWasPressed:(UIButton *)sender;
//- (IBAction)operationWasPressed:(id)sender;
- (IBAction)enterWasPressed:(UIButton *)sender;

//- (void)obtainOperandPressedName;
//- (void)obtainOperationPressedName;
//- (void)enterPressed;
//- (void)appendNewNumeral;
//- (void)addOperandToStack;
//- (void)performSelectedOperation;

@end
