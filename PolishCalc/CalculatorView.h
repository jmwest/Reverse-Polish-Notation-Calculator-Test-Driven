//
//  CalculatorView.h
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorView : UIView

@property (strong, nonatomic) UIButton *zero;
@property (strong, nonatomic) UIButton *one;
@property (strong, nonatomic) UIButton *two;
@property (strong, nonatomic) UIButton *three;
@property (strong, nonatomic) UIButton *four;
@property (strong, nonatomic) UIButton *five;
@property (strong, nonatomic) UIButton *six;
@property (strong, nonatomic) UIButton *seven;
@property (strong, nonatomic) UIButton *eight;
@property (strong, nonatomic) UIButton *nine;
@property (strong, nonatomic) UIButton *add;
@property (strong, nonatomic) UIButton *subtract;
@property (strong, nonatomic) UIButton *multiply;
@property (strong, nonatomic) UIButton *divide;
@property (strong, nonatomic) UIButton *enter;
@property (strong, nonatomic) UILabel *display;

@end
