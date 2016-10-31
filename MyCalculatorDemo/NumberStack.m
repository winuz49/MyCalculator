//
//  NumberStack.m
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import "NumberStack.h"

@implementation NumberStack
-(id)init
{
    
    stackSize=100;
    TopOfStack=-1;
    return self;
}



-(void)disposeStack
{
    memset(nums, 0.0, sizeof(float));
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

-(void)push:(float)newEle
{
    if(TopOfStack <stackSize)
    {
        nums[++TopOfStack]=newEle;
    }
    else{
        exit(0);
    }
}

-(float)pop
{
    if(TopOfStack>=0)
        return nums[TopOfStack--];
    else
    {
        NSLog(@"字符串不是数学表达式无法计算");
        exit(0);
    }
}


-(float)top
{
    
    if(TopOfStack>=0)
    {
        return nums[TopOfStack];
    }
    else
    {
        exit(0);
    }
}
@end
