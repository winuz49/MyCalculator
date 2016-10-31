//
//  NumberStack.h
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberStack : NSObject
{
    int stackSize;
    int TopOfStack;
    float nums[100];
    
}


-(void)disposeStack;
-(int)isEmpty;
-(void)push:(float)newEle;
-(float)pop;
-(float)top;
@end
