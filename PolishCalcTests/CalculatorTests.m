//
//  CalculatorTests.m
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "Calculator.h"

@interface CalculatorTests : GHTestCase
{
    Calculator *calc;
}

@end

@implementation CalculatorTests

- (void)setUp
{
    calc = [[Calculator alloc] init];
}

- (void)tearDown
{
    calc = nil;
}

- (void)testCalculatorCanBeCreated
{
    GHAssertNotNil([[Calculator alloc] init], @"We should have a pointer to a model after init");
}

- (void)testStackIsNotNilAfterInit
{
    GHAssertNotNil(calc.stack, @"The stack should be instantiated at the same time as the calculator");
}

- (void)testStackDoesNotHaveInitializedValues
{
    GHAssertTrue([calc.stack count] == 0, @"The stack should not have any initialized values");
}

- (void)testCanPushNumberOntoStack
{
    [calc pushNumberOnStack:@"11"];
    GHAssertTrue([calc.stack count] == 1, @"Pushing a number onto the empty stack should yield a count of 1");
}

- (void)testNumberPushedOnStackIsNumberOnStack
{
    [calc pushNumberOnStack:@"11"];
    GHAssertEqualStrings([calc.stack objectAtIndex:0], @"11" , @"Object we push on stack should be the object on the stack");
}

- (void)testThatNumberPushedOnStackIsLastNumberOnStack
{
    [calc pushNumberOnStack:@"3"];
    [calc pushNumberOnStack:@"4"];
    GHAssertEqualStrings([calc.stack objectAtIndex:[calc.stack count] - 1], @"4", @"Object we push on stack should be the last object on the stack");

}

- (void)testOperandOneIsNotNilAfterInit
{
    GHAssertNotNil(calc.operandOne, @"OperandOne should be instantiated at the same time as calc");
}

- (void)testOperandTwoIsNotNilAfterInit
{
    GHAssertNotNil(calc.operandTwo, @"OperandOne should be instantiated at the same time as calc");
}

- (void)testOperandsTakenOffStackAreSeparatedIntoOperandOneAndOperandTwo
{
    [calc pushNumberOnStack:@"1"];
    [calc pushNumberOnStack:@"2"];
    [calc pushNumberOnStack:@"3"];
    [calc pushNumberOnStack:@"4"];
    [calc popLastTwoOperandsOffStack:calc.stack];
    GHAssertEqualStrings(calc.operandOne, @"4", @"OperandOne is equal to the last string on the stack");
    GHAssertEqualStrings(calc.operandTwo, @"3", @"OperandTwo is equal to the string before the last string on the stack");
}

- (void)testOperandsTakenOffStackAreNoLongerOnStack
{
    [calc pushNumberOnStack:@"1"];
    [calc pushNumberOnStack:@"2"];
    [calc pushNumberOnStack:@"3"];
    [calc pushNumberOnStack:@"4"];
    [calc popLastTwoOperandsOffStack:calc.stack];
    GHAssertTrue( [[calc.stack objectAtIndex:( [calc.stack count] - 1 ) ] isEqualToString:@"2"], @"After the last object has been popped off the stack, it should no longer be on the stack");
    GHAssertTrue( [[calc.stack objectAtIndex:( [calc.stack count] - 2 ) ] isEqualToString:@"1"], @"After the last object has been popped off the stack, it should no longer be on the stack");
    
}

-(void)testOperationIsNotNilAfterInit
{
    GHAssertNotNil(calc.operation, @"The operations should be initialized at start of program");
}

-(void)testTheTwoOperandsWillGetAddedTogether
{
    [calc pushNumberOnStack:@"1"];
    [calc pushNumberOnStack:@"2"];
    [calc pushNumberOnStack:@"2"];
    [calc pushNumberOnStack:@"5"];
    [calc popLastTwoOperandsOffStack:calc.stack];
    calc.operation = @"+";
    [calc calculateUsingFirstOperandOffStack:calc.operandOne andSecondOperandOffStack:calc.operandTwo];
    GHAssertTrue([[calc.stack objectAtIndex:( [calc.stack count] - 1 ) ] isEqualToString:@"7"], @"The final answer after the addition operation should be 7");
}

- (void)testThatOperationComparisonInIfStatementSucceeds
{
    calc.operation = @"+";
    BOOL didWork;
    if ([calc.operation isEqualToString:@"+"]) {
        didWork = YES;
    }
    else
    {
        didWork = NO;
    }
    GHAssertTrue(didWork == YES, @"Test to see if an operation comparison works correctly with an if/else statement");
    
}

-(void)testTheTwoOperandsWillGetSubtracted
{
    [calc pushNumberOnStack:@"1"];
    [calc pushNumberOnStack:@"2"];
    calc.operation = @"-";
    [calc calculateUsingFirstOperandOffStack:@"5" andSecondOperandOffStack:@"2"];
    GHAssertTrue([[calc.stack objectAtIndex:( [calc.stack count] - 1 ) ] isEqualToString:@"3"], @"The final answer after the addition operation should be 3");
}

-(void)testTheTwoOperandsWillGetMultipliedTogether
{
    [calc pushNumberOnStack:@"1"];
    [calc pushNumberOnStack:@"2"];
    calc.operation = @"*";
    [calc calculateUsingFirstOperandOffStack:@"5" andSecondOperandOffStack:@"2"];
    GHAssertTrue([[calc.stack objectAtIndex:( [calc.stack count] - 1 ) ] isEqualToString:@"10"], @"The final answer after the addition operation should be 10");
}

-(void)testTheTwoOperandsWillGetDivided
{
    [calc pushNumberOnStack:@"1"];
    [calc pushNumberOnStack:@"2"];
    calc.operation = @"/";
    [calc calculateUsingFirstOperandOffStack:@"5" andSecondOperandOffStack:@"2"];
    GHAssertTrue([[calc.stack objectAtIndex:( [calc.stack count] - 1 ) ] isEqualToString:@"2.5"], @"The final answer after the addition operation should be 2.5");
}

- (void)testOnlyOneOperandForOperation
{
    [calc pushNumberOnStack:@"1"];
    [calc popLastTwoOperandsOffStack:calc.stack];
    calc.operation = @"+";
    [calc calculateUsingFirstOperandOffStack:calc.operandOne andSecondOperandOffStack:calc.operandTwo];
    GHAssertTrue([[calc.stack objectAtIndex:[calc.stack count] - 1] isEqualToString:@"1"], @"If there is only one operand and an operation is performed, the operand should be returned to the stack");
}

-(void)testForDivideByZero
{
    [calc pushNumberOnStack:@"0"];
    [calc pushNumberOnStack:@"4"];
    [calc popLastTwoOperandsOffStack:calc.stack];
    calc.operation = @"/";
    GHAssertFalse([calc calculateUsingFirstOperandOffStack:calc.operandOne andSecondOperandOffStack:calc.operandTwo], @"If there is a divide by zero error, the method returns false");
}

-(void)testForNotDivideByZero
{
    [calc pushNumberOnStack:@"1"];
    [calc pushNumberOnStack:@"4"];
    [calc popLastTwoOperandsOffStack:calc.stack];
    calc.operation = @"/";
    GHAssertTrue([calc calculateUsingFirstOperandOffStack:calc.operandOne andSecondOperandOffStack:calc.operandTwo], @"If there are valid operands, the method returns true");
}

@end
