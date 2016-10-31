//
//  SignStack.h
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignStack : NSObject
{
    int stackSize;
    int TopOfStack;
    unichar *s;
    
}

-(BOOL)creatStack:(int)size;
-(void)disposeStack;
-(int)isEmpty;
-(void)push:(unichar)newEle;
-(unichar)pop;
-(unichar)top;
@end
