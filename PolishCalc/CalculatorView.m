//
//  CalculatorView.m
//  PolishCalc
//
//  Created by John West on 5/22/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CalculatorView.h"
#import <QuartzCore/QuartzCore.h>
#define COLUMN_ONE_LEFT_BOUND 24
#define COLUMN_TWO_LEFT_BOUND 98
#define COLUMN_THREE_LEFT_BOUND 172
#define COLUMN_FOUR_LEFT_BOUND 246
#define ROW_ONE_TOP_BOUND 30
#define ROW_TWO_TOP_BOUND 120
#define ROW_THREE_TOP_BOUND 210
#define ROW_FOUR_TOP_BOUND 300
#define ROW_FIVE_TOP_BOUND 390
#define BUTTON_HEIGHT 50
#define BUTTON_WIDTH 50
#define ENTER_WIDTH 124
#define DISPLAY_WIDTH 272

@implementation CalculatorView

@synthesize zero = _zero;
@synthesize one = _one;
@synthesize two = _two;
@synthesize three = _three;
@synthesize four = _four;
@synthesize five = _five;
@synthesize six = _six;
@synthesize seven = _seven;
@synthesize eight = _eight;
@synthesize nine = _nine;
@synthesize add = _add;
@synthesize subtract = _subtract;
@synthesize multiply = _multiply;
@synthesize divide = _divide;
@synthesize enter = _enter;
@synthesize display = _display;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor magentaColor]];
        
        self.zero = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.zero setFrame:CGRectMake(COLUMN_ONE_LEFT_BOUND, ROW_FIVE_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.zero setTitle:@"0" forState:UIControlStateNormal];
        
        self.one = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.one setFrame:CGRectMake(COLUMN_ONE_LEFT_BOUND, ROW_FOUR_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.one setTitle:@"1" forState:UIControlStateNormal];
        
        self.two = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.two setFrame:CGRectMake(COLUMN_TWO_LEFT_BOUND, ROW_FOUR_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.two setTitle:@"2" forState:UIControlStateNormal];
        
        self.three = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.three setFrame:CGRectMake(COLUMN_THREE_LEFT_BOUND, ROW_FOUR_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.three setTitle:@"3" forState:UIControlStateNormal];
        
        self.four = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.four setFrame:CGRectMake(COLUMN_ONE_LEFT_BOUND, ROW_THREE_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.four setTitle:@"4" forState:UIControlStateNormal];
        
        self.five = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.five setFrame:CGRectMake(COLUMN_TWO_LEFT_BOUND, ROW_THREE_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.five setTitle:@"5" forState:UIControlStateNormal];
        
        self.six = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.six setFrame:CGRectMake(COLUMN_THREE_LEFT_BOUND, ROW_THREE_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.six setTitle:@"6" forState:UIControlStateNormal];
        
        self.seven = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.seven setFrame:CGRectMake(COLUMN_ONE_LEFT_BOUND, ROW_TWO_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.seven setTitle:@"7" forState:UIControlStateNormal];
        
        self.eight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.eight setFrame:CGRectMake(COLUMN_TWO_LEFT_BOUND, ROW_TWO_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.eight setTitle:@"8" forState:UIControlStateNormal];
        
        self.nine = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.nine setFrame:CGRectMake(COLUMN_THREE_LEFT_BOUND, ROW_TWO_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.nine setTitle:@"9" forState:UIControlStateNormal];
        
        self.add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.add setFrame:CGRectMake(COLUMN_FOUR_LEFT_BOUND, ROW_TWO_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.add setTitle:@"+" forState:UIControlStateNormal];
        
        self.subtract = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.subtract setFrame:CGRectMake(COLUMN_FOUR_LEFT_BOUND, ROW_THREE_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.subtract setTitle:@"-" forState:UIControlStateNormal];
        
        self.multiply = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.multiply setFrame:CGRectMake(COLUMN_FOUR_LEFT_BOUND, ROW_FOUR_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.multiply setTitle:@"*" forState:UIControlStateNormal];
        
        self.divide = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.divide setFrame:CGRectMake(COLUMN_FOUR_LEFT_BOUND, ROW_FIVE_TOP_BOUND, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.divide setTitle:@"/" forState:UIControlStateNormal];
        
        self.enter = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.enter setFrame:CGRectMake(COLUMN_TWO_LEFT_BOUND, ROW_FIVE_TOP_BOUND, ENTER_WIDTH, BUTTON_HEIGHT)];
        [self.enter setTitle:@"Enter" forState:UIControlStateNormal];
        
        self.display = [[UILabel alloc] initWithFrame:CGRectMake(COLUMN_ONE_LEFT_BOUND, ROW_ONE_TOP_BOUND, DISPLAY_WIDTH, BUTTON_HEIGHT)];
        [self.display setBackgroundColor:[UIColor whiteColor]];
        [self.display setTextAlignment:NSTextAlignmentRight];
        [self.display setText:@"0"];
        
        [self addSubview:self.zero];
        [self addSubview:self.one];
        [self addSubview:self.two];
        [self addSubview:self.three];
        [self addSubview:self.four];
        [self addSubview:self.five];
        [self addSubview:self.six];
        [self addSubview:self.seven];
        [self addSubview:self.eight];
        [self addSubview:self.nine];
        [self addSubview:self.add];
        [self addSubview:self.subtract];
        [self addSubview:self.multiply];
        [self addSubview:self.divide];
        [self addSubview:self.enter];
        [self addSubview:self.display];
        
        }
    return self;
}



@end
