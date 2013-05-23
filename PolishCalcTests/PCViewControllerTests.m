//
//  PCViewControllerTests.m
//  PolishCalc
//
//  Created by John West on 5/23/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "PCViewController.h"
#import "CalculatorView.h"
#import "Calculator.h"

@interface PCViewControllerTests : GHTestCase
{
    PCViewController *controller;
    Calculator *calc;
}

@end

@implementation PCViewControllerTests

- (void)setUp
{
    controller = [[PCViewController alloc] init];
}

- (void)tearDown
{
    controller = nil;
}

- (void)testCurrentOperandDoesNotInitAsNil
{
    controller.currentOperand = [[NSString alloc] init];
    GHAssertNotNil(controller.currentOperand, @"The current operand is not initialized to nil");
}

- (void)testCurrentOperandHasLengthZeroAtStart
{
    controller.currentOperand = [[NSString alloc] init];
    GHAssertTrue([controller.currentOperand length] == 0, @"currentOperand should not contain any characters");
}

- (void)testViewIsInitAtSameTimeAsController
{
    GHAssertNotNil([[CalculatorView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)], @"The view is created and is not nil");
}

- (void)testPressingDigitButtonSendsCorrectTitle
{
    UIButton *oneMock = [[UIButton alloc] init];
    [oneMock setTitle:@"1" forState:UIControlStateNormal];
    [controller operandWasPressed:oneMock];
    GHAssertEqualStrings(controller.operandPressed, @"1", @"The title of the button should be obtained when pressed");
}

- (void)testButtonPressedTitleIsAddedToCurrentOperand
{
    controller.currentOperand = @"3";
    UIButton *oneMock = [[UIButton alloc] init];
    [oneMock setTitle:@"1" forState:UIControlStateNormal];
    [controller operandWasPressed:oneMock];
    GHAssertEqualStrings(controller.currentOperand, @"31", @"CurrentOperand should be a string with operandPressed appended onto it unless currentOperand is nil");
}

- (void)testCurrentOperandCanBeAppendedIfItStartsAsAnEmptyString
{
    UIButton *oneMock = [[UIButton alloc] init];
    [oneMock setTitle:@"1" forState:UIControlStateNormal];
    [controller operandWasPressed:oneMock];
    GHAssertEqualStrings(controller.currentOperand, @"1", @"CurrentOperand should be a string with operandPressed appended onto it unless currentOperand is nil");
}

- (void)testWhenEnterIsPressedCurrentOperandIsAddedToStack
{
    calc = [[Calculator alloc] init];
    UIButton *oneMock = [[UIButton alloc] init];
    [oneMock setTitle:@"1" forState:UIControlStateNormal];
    [controller operandWasPressed:oneMock];
    [controller operandWasPressed:oneMock];
    UIButton *enterMock = [[UIButton alloc] init];
    [controller enterWasPressed:enterMock];
    GHAssertTrue([[calc.stack objectAtIndex:0] isEqualToString: @"11"], @"When enter is pressed, the current operand should be added to the stack");
    
}

//- (void)testCorrectNumeralIsPulledFromButton
//{
//    controller.operandPressed = @"4";
//    [controller appendNewNumeral];
//    
//}

@end
