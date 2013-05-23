//
//  PCViewController.m
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "PCViewController.h"
#import "CalculatorView.h"

#define LEFT_X 0
#define TOP_Y 0
#define SCREEN_HEIGHT 480
#define SCREEN_WIDTH 320

@interface PCViewController ()

@property (strong, nonatomic) CalculatorView *view;

@end

@implementation PCViewController

@synthesize currentOperand = _currentOperand;
@synthesize operandPressed = _operandPressed;
@synthesize operationPressed = _operationPressed;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[CalculatorView alloc] initWithFrame:CGRectMake(LEFT_X, TOP_Y, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self initializeButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.calc = [[Calculator alloc] init];
        self.currentOperand = [[NSString alloc] init];
        self.operandPressed = [[NSString alloc] init];
        self.operationPressed = [[NSString alloc] init];
    }
    return self;
}

- (void)initializeButtons
{
    [self.view.zero addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.one addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.two addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.three addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.four addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.five addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.six addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.seven addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.eight addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.nine addTarget:self action:@selector(operandWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.add addTarget:self action:@selector(operationWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.subtract addTarget:self action:@selector(operationWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.multiply addTarget:self action:@selector(operationWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.divide addTarget:self action:@selector(operationWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.enter addTarget:self action:@selector(enterWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.clear addTarget:self action:@selector(clearWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (IBAction)clearWasPressed:(UIButton *)sender
{
    [self.calc.stack removeAllObjects];
    self.currentOperand = @"";
    [self.view.display setText:@"0"];
}

- (void)operandWasPressed:(UIButton *)sender
{
    self.operandPressed = sender.currentTitle;
    [self obtainOperandPressedName];
}

- (BOOL)operationWasPressed:(UIButton *)sender
{
    if ([self.currentOperand length] != 0) {
        [self.calc pushNumberOnStack:self.currentOperand];
        [self.view.display setText:@"0"];
        self.currentOperand = @"";
    }
    BOOL result;
    self.operationPressed = sender.currentTitle;
    self.calc.operation = self.operationPressed;
//    self.calc.operation = sender.currentTitle;
    [self.calc popLastTwoOperandsOffStack:self.calc.stack];
    result = [self.calc calculateUsingFirstOperandOffStack:self.calc.operandOne andSecondOperandOffStack:self.calc.operandTwo];
    NSLog(@"%@", [self.calc.stack objectAtIndex:[self.calc.stack count] - 1]);
    [self.view.display setText:[self.calc.stack objectAtIndex:[self.calc.stack count] - 1]];
    return result;
}

- (BOOL)enterWasPressed:(UIButton *)sender
{
    [self.calc pushNumberOnStack:self.currentOperand];
    [self.view.display setText:@"0"];
    self.currentOperand = @"";
    return YES;
}

- (IBAction)obtainOperandPressedName
{
    if ([self.currentOperand length] == 0) {
        self.currentOperand = self.operandPressed;
        [self.view.display setText:self.currentOperand];
    }
    else {
        self.currentOperand = [self.currentOperand stringByAppendingString:self.operandPressed];
        [self.view.display setText:self.currentOperand];
    }
}

-(BOOL)respondsToSelector:(SEL)aSelector
{
    return YES;
}

@end
