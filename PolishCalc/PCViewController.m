//
//  PCViewController.m
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "PCViewController.h"
#define LEFT_X 0
#define TOP_Y 0
#define SCREEN_HEIGHT 480
#define SCREEN_WIDTH 320

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[CalculatorView alloc] initWithFrame:CGRectMake(LEFT_X, TOP_Y, SCREEN_WIDTH, SCREEN_HEIGHT)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
