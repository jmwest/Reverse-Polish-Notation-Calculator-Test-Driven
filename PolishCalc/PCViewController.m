//
//  PCViewController.m
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "PCViewController.h"
#import "CalculatorView.h"
#import "Calculator.h"
#define LEFT_X 0
#define TOP_Y 0
#define SCREEN_HEIGHT 480
#define SCREEN_WIDTH 320

@interface PCViewController ()

@property (strong, nonatomic) CalculatorView *view;

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view = [[CalculatorView alloc] initWithFrame:CGRectMake(LEFT_X, TOP_Y, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    [self.view.zero addTarget:self action: forControlEvents:UIControlEventTouchUpInside];
//    [self.view.one addTarget:self action:obtainOperandPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.two addTarget:self action:obtainOperandPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.three addTarget:self action:obtainOperandPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.four addTarget:self action:obtainButtonPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.five addTarget:self action:obtainButtonPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.six addTarget:self action:obtainButtonPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.seven addTarget:self action:obtainButtonPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.eight addTarget:self action:obtainButtonPressedName forControlEvents:UIControlEventTouchUpInside];
//    [self.view.nine addTarget:self action:obtainButtonPressedName forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)operandWasPressed:(UIButton *)sender
{
    self.operandPressed = sender.currentTitle;
    [self obtainOperandPressedName];
}

- (void)obtainOperandPressedName
{
    if ([self.currentOperand length] == 0) {
        self.currentOperand = self.operandPressed;
    }
    else {
        self.currentOperand = [self.currentOperand stringByAppendingString:self.operandPressed];
    }
}

- (void)enterWasPressed:(UIButton *)sender
{
    [self.calc pushNumberOnStack:self.currentOperand];
}

@end
