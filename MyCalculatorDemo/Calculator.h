//
//  Calculator.h
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SignStack.h"
#import "NumberStack.h"
@interface Calculator : NSObject

@property(nonatomic,strong) NSMutableString *calStr;
@property(nonatomic,strong) NSMutableString *screen;
@property(nonatomic,strong) SignStack *signStack;
@property(nonatomic,strong) NumberStack *numStack;
    




-(NSString *)Calculate;
@end
