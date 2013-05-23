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
    GHAssertNotNil(controller.currentOperand, @"The current operand is not initialized to nil");
}

- (void)testOperandPressedDoesNotInitAsNil
{
    GHAssertNotNil(controller.operandPressed, @"The operand pressed is not initialized to nil");
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

- (void)testThatTheViewControllerHasACalculator
{
    GHAssertNotNil(controller.calc, @"The controller should have an initialized calculator");
}

- (void)testWhenEnterIsPressedCurrentOperandIsAddedToStack
{
    UIButton *oneMock = [[UIButton alloc] init];
    [oneMock setTitle:@"1" forState:UIControlStateNormal];
    [controller operandWasPressed:oneMock];
    [controller operandWasPressed:oneMock];
    UIButton *enterMock = [[UIButton alloc] init];
    GHAssertEquals([controller enterWasPressed:enterMock], YES, @"When the enter button is pressed, the method should return YES if it successfully sends the current operand to the model");
    
}

- (void)testThatCurrentOperandIsSetToNilWhenEnterIsPressed
{
    UIButton *oneMock = [[UIButton alloc] init];
    [oneMock setTitle:@"1" forState:UIControlStateNormal];
    [controller operandWasPressed:oneMock];
    [controller operandWasPressed:oneMock];
    UIButton *enterMock = [[UIButton alloc] init];
    [controller enterWasPressed:enterMock];
    GHAssertTrue([controller.currentOperand length] == 0, @"When the enter button is pressed, currentOperand is set to an empty string");
}

-(void)testThatOperationPressedIsCorrectOperationPressed
{
    [controller.calc.stack addObject:@"1"];
    [controller.calc.stack addObject:@"34"];
    [controller.calc.stack addObject:@"19"];
    [controller.calc.stack addObject:@"13"];
    [controller.calc.stack addObject:@"7"];
    UIButton *addMock = [[UIButton alloc] init];
    [addMock setTitle:@"+" forState:UIControlStateNormal];
    [controller operationWasPressed:addMock];
    GHAssertTrue([controller.operationPressed isEqualToString:@"+"], @"This should return YES if the add operation was selected");
}

-(void)testThatCorrectOperationIsSentToModel
{
    [controller.calc.stack addObject:@"1"];
    [controller.calc.stack addObject:@"34"];
    [controller.calc.stack addObject:@"19"];
    [controller.calc.stack addObject:@"13"];
    [controller.calc.stack addObject:@"7"];
    UIButton *addMock = [[UIButton alloc] init];
    [addMock setTitle:@"+" forState:UIControlStateNormal];
    GHAssertTrue([controller operationWasPressed:addMock], @"The operation that is used should be addition");
}

- (void)testCurrentOperandIsCommittedIfOperationIsPressed
{
    [controller.calc.stack addObject:@"1"];
    [controller.calc.stack addObject:@"34"];
    [controller.calc.stack addObject:@"19"];
    [controller.calc.stack addObject:@"13"];
    controller.currentOperand = @"12";
    UIButton *addMock = [[UIButton alloc] init];
    [addMock setTitle:@"+" forState:UIControlStateNormal];
    [controller operationWasPressed:addMock];
    GHAssertTrue([[controller.calc.stack objectAtIndex:[controller.calc.stack count] - 1] isEqualToString:@"25"], @"If there is a current operand, and an operation is pressed, the current operand should be added to the stack");
}

-(void)testIfHittingClearWillSetStackCountToZero
{
    [controller.calc.stack addObject:@"1"];
    [controller.calc.stack addObject:@"34"];
    [controller.calc.stack addObject:@"19"];
    [controller.calc.stack addObject:@"13"];
    UIButton *clearMock = [[UIButton alloc] init];
    [controller clearWasPressed: clearMock];
    GHAssertTrue([controller.calc.stack count] == 0, @"When the Clear button is pressed, the stack should be an empty string; count will be zero" );
    
}

-(void)testIfHittingClearWillSetCurrentOperandToEmptyString
{
    controller.currentOperand = @"12";
    UIButton *clearMock = [[UIButton alloc] init];
    [controller clearWasPressed: clearMock];
    GHAssertTrue([controller.currentOperand length] == 0, @"When the Clear button is pressed, the currentOperand should be an empty string; length will be zero" );
}

-(void)testIfHittingClearWillNotMakeStackNil
{
    [controller.calc.stack addObject:@"1"];
    [controller.calc.stack addObject:@"34"];
    [controller.calc.stack addObject:@"19"];
    [controller.calc.stack addObject:@"13"];
    UIButton *clearMock = [[UIButton alloc] init];
    [controller clearWasPressed: clearMock];
    GHAssertNotNil(controller.calc.stack, @"The stack should not be set to nil after clear is hit");
}

//-(void)testIfHittingEveryOperationRespondsToOperationWasSelectedMethod
//{
//    GHAssertTrue([controller respondsToSelector:@selector(operationWasPressed:)] == NO, @"This should return true if the add button responds to operationWasPressed");
//}

@end
