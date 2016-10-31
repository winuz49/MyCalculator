//
//  Calculator.m
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
-(id)init
{
    if(self=[super init])
    {
        self.numStack=[[NumberStack alloc] init];
        self.signStack=[[SignStack alloc] init];
        self.screen=[[NSMutableString alloc] init];
        self.calStr=[[NSMutableString alloc] init];
    }
    
    
    return self;
}


/*选择行列标*/
-(int)ChooseIJ:(unichar)index
{
    int i=0;
    switch(index)
    {
        case '+':
            i=0;
            break;
        case '-':
            i=1;
            break;
        case '*':
            i=2;
            break;
        case '/':
            i=3;
            break;
        case '(':
            i=4;
            break;
        case ')':
            i=5;
            break;
        case '#':
            i=6;
    }
    
    return i;
}

/*判断运算符优先级*/
-(unichar)Judge:(unichar)top andChar2:(unichar)ch
{
    static unichar order[][7]={
        // +   -   *   /   (   )   #
        /* + */ '>','>','<','<','<','>','>',
        /* - */ '>','>','<','<','<','>','>',
        /* * */ '>','>','>','>','<','>','>',
        /* / */ '>','>','>','>','<','>','>',
        /* ( */ '<','<','<','<','<','=',' ',
        /* ) */ '>','>','>','>',' ','>','>',
        /* # */ '<','<','<','<','<',' ','='
    };
    int i=0,j=0;
    
    i = [self ChooseIJ:top];
    j = [self ChooseIJ:ch];
    
    return order[i][j];
}

/*运算:O1 运算符 O2*/
-(float)Operate:(float)num1 andOp:(unichar)op andNum2:(float)num2
{
    float result=0;
    
    
    switch(op)
    {
        case '+':
            result = num1 + num2;
            break;
        case '-':
            result = num1 - num2;
            break;
        case '*':
            result = num1 * num2;
            break;
        case '/':
            result = num1 / num2;
            break;
    }
    
    //输出运算过程
    printf("%f %c %f = %f\n", num1, op, num2, result);
    return result;
}


-(BOOL)isOperate:(unichar)ch
{
    BOOL flag=NO;
    if(ch=='-' || ch=='+' ||ch=='*' || ch=='/' || ch=='(' || ch==')' || ch=='#')
    {
        flag=YES;
    }
    
    return flag;
}



/* 计算数学表达式*/
-(NSString *)Calculate
{
    NSLog(@"test cal");
    NSMutableString *newStr=[NSMutableString stringWithFormat:@"%@#", self.calStr];
    int index=0;
    int i=0;
    NSString * resultStr;
    NSUInteger length=[newStr length] ;
    unichar ch='#' ;
    float num;
    NSLog(@"得到的值 %@",self.calStr);
    NSLog(@"得到的值 %@",newStr);
    [self.signStack push:ch];
    
    
    while(index<length)
    {
        //        NSLog(@"index: %d length %ld",index,(long)length);
        ch=[newStr characterAtIndex:index];
        
        if([self isOperate:ch])
        {
            i++;
            index=i;
            NSLog(@"sign: %C",ch);
            
            unichar top=[self.signStack top];
            unichar cmp=[self Judge:top andChar2:ch];
            switch(cmp)
            {
                case '<':
                {
                    [self.signStack push:ch];
                    break;
                }
                case '=':
                {
                    [self.signStack pop];
                    break;
                }
                case '>':
                {
                    unichar op=[self.signStack pop];
                    if([self.numStack isEmpty])
                    {
                        break;
                    }
                    float n1=[self.numStack pop];
                    float n2=[self.numStack pop];
                    float result=[self Operate:n2 andOp:op andNum2:n1];
                    NSLog(@"result %f",result);
                    [self.numStack push:result];
                    i--;
                    index=i;
                    break;
                }
                    
                default:
                    break;
                    
            }
            
            continue;
            
        }else
        {
            while(++i<length)
            {
                
                ch=[newStr characterAtIndex:i];
                if(![self isOperate:ch])
                {
                    continue;
                }else
                {
                    break;
                }
                
                
            }
            
            num=[ [newStr substringWithRange:NSMakeRange(index, i-index) ] floatValue];
            [self.numStack push:num];
            index=i;
            
           
            
        }
        
        
    }
    
   
    NSLog(@"final test");
    int flag=[self.signStack isEmpty] ||([self.signStack pop]=='#');
    if(flag)
    {
        NSLog(@"final result %f",[self.numStack top]);
        float resultFloat=[self.numStack top];
        resultStr=[NSString stringWithFormat:@"%.2f", resultFloat];
//        self.calStr=[NSMutableString stringWithFormat:@"%@", resultStr];
    }
    
    else
    {
        NSLog(@"字符串不是数学表达式无法计算");
        resultStr=[NSString stringWithFormat:@"error"];
//        self.calStr=[NSMutableString stringWithFormat:@"%@", resultStr];
        
    }
    
   
    
    return  resultStr;
    
}

@end
