//
//  Calculator.h
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (strong, nonatomic) NSMutableArray *stack;
@property (strong, nonatomic) NSString *operandOne;
@property (strong, nonatomic) NSString *operandTwo;
@property (strong, nonatomic) NSString *operation;

- (id)init;

- (void)pushNumberOnStack:(NSString *)number;
- (void)popLastTwoOperandsOffStack:(NSMutableArray *) array;
- (BOOL)calculateUsingFirstOperandOffStack:(NSString *)firstOperand andSecondOperandOffStack:(NSString *)secondOperand;

@end
