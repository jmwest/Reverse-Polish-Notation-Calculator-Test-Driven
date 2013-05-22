//
//  Calculator.m
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize stack = _stack;
@synthesize operandOne = _operandOne;
@synthesize operandTwo = _operandTwo;
@synthesize operation = _operation;

- (id)init
{
    self = [super init];
    if (self) {
        [self setStack:[[NSMutableArray alloc] init]];
        self.operandOne = [[NSString alloc] init];
        self.operandTwo = [[NSString alloc] init];
        self.operation = [[NSString alloc] init];

    }
    return self;
}

- (void)pushNumberOnStack:(NSString *)number
{
    [self.stack addObject:number];
}

- (void)popLastTwoOperandsOffStack:(NSMutableArray *)array
{
    if ([self.stack count] <= 1) {
        self.operandOne = [self.stack objectAtIndex:[self.stack count] - 1];
        self.operandTwo = nil;
    }
    else
    {
        self.operandOne = [self.stack objectAtIndex:[self.stack count] - 1];
        self.operandTwo = [self.stack objectAtIndex:[self.stack count] - 2];
        [self.stack removeLastObject];
        [self.stack removeLastObject];
    }
}

- (BOOL)calculateUsingFirstOperandOffStack:(NSString *)firstOperand andSecondOperandOffStack:(NSString *)secondOperand
{
    if([self.operation isEqualToString:@"+"])
    {
        double operandTwoDouble;
        double operandOneDouble = [firstOperand doubleValue];
        
        if (secondOperand == nil) {
            secondOperand = @"0";
        }
        
        operandTwoDouble = [secondOperand doubleValue];
        double operandToPushBackDouble = operandOneDouble + operandTwoDouble;
        [self.stack addObject:[NSString stringWithFormat:@"%g", operandToPushBackDouble]];
    }
    else if ([self.operation isEqualToString:@"-"])
    {
        double operandOneDouble = [firstOperand doubleValue];
        double operandTwoDouble = [secondOperand doubleValue];
        
        if (secondOperand == nil) {
            secondOperand = @"0";
        }
        
        double operandToPushBackDouble = operandOneDouble - operandTwoDouble;
        [self.stack addObject:[NSString stringWithFormat:@"%g", operandToPushBackDouble]];
    }
    else if ([self.operation isEqualToString:@"*"])
    {
        double operandOneDouble = [firstOperand doubleValue];
        double operandTwoDouble = [secondOperand doubleValue];
        
        if (secondOperand == nil) {
            secondOperand = @"1";
        }
        
        double operandToPushBackDouble = operandOneDouble * operandTwoDouble;
        [self.stack addObject:[NSString stringWithFormat:@"%g", operandToPushBackDouble]];
    }
    else if ([self.operation isEqualToString:@"/"])
    {
        double operandOneDouble = [firstOperand doubleValue];
        double operandTwoDouble = [secondOperand doubleValue];
        
        if (secondOperand == nil) {
            secondOperand = @"1";
        }
        if ([secondOperand isEqualToString:@"0"])
        {
            return NO;
        }
        
        double operandToPushBackDouble = operandOneDouble / operandTwoDouble;
        [self.stack addObject:[NSString stringWithFormat:@"%g", operandToPushBackDouble]];
    }
    return YES;

}

@end
