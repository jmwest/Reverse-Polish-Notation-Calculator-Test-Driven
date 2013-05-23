//
//  CalcViewControllerTests.m
//  PolishCalc
//
//  Created by John West on 5/23/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "PCViewController.h"

@interface CalcViewControllerTests : GHTestCase
{
    PCViewController *controller;
}
@end

@implementation CalcViewControllerTests

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

- (void)testViewIsInitAtSameTimeAsController
{
    GHAssertNotNil([[CalculatorView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)], @"The view is created and is not nil");
}

- (void)testCorrectNumeralIsPulledFromButton
{
    controller.operandPressed = @"4";
    [controller appendNewNumeral];
    
}


@end
