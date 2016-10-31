//
//  SignStack.m
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import "SignStack.h"

@implementation SignStack
-(id)init
{
    
    if(self=[super init])
    {
        [self creatStack:100];
    }
    
    return self;
}

-(id)init:(int)size
{
    
    if(self=[super init])
    {
        [self creatStack:size];
    }
    
    return self;
}


-(BOOL)creatStack:(int)size
{
    s=malloc(size*sizeof(unichar));
    if(s==NULL)
    {
        return NO;
    }
    stackSize=size;
    TopOfStack=-1;
    return YES;
}


-(void)disposeStack
{
    s=NULL;
    stackSize=0;
    TopOfStack=-1;
}

-(int)isEmpty
{
    if(TopOfStack==-1)
    {
        return YES;
    }
    return NO;
}

-(void)push:(unichar)newEle
{
    if(TopOfStack <stackSize)
    {
        s[++TopOfStack]=newEle;
    }
    else{
        exit(0);
    }
}

//TODO error
-(unichar)pop
{
    if(TopOfStack>=0)
        return s[TopOfStack--];
    else
    {
        NSLog(@"字符串不是数学表达式无法计算");
        exit(0);
    }
    
}


-(unichar)top
{
    
    if(TopOfStack>=0)
    {
        return s[TopOfStack];
    }
    else
    {
        NSLog(@"字符串不是数学表达式无法计算");
        exit(0);
    }
}
@end
