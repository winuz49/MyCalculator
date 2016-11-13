//
//  AdvancedViewController.m
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/30.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import "AdvancedViewController.h"
#import "math.h"
@interface AdvancedViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textTxt;

@end

@implementation AdvancedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.calculator=[[Calculator alloc] init];
    
}

// TODO fix bug add error judge
- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSString *text=[[sender titleLabel]text];
    NSLog(@"ad text is%@",text);
    if([text isEqualToString:@"("])
    {
        [self addStr:@"("];
        
        self.textTxt.text=self.calculator.screen;
    }else if([text isEqualToString:@")"]){
        
        [self addStr:@")"];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"e"]){
        [self clearCal];
        [self addStr:@"2.718281828459"];
        
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"Pi"]){
        [self clearCal];
        [self addStr:@"3.1415926535897"];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"abs"]){
        
        float result=[self.calculator.calStr floatValue];
        if(result<0)
        {
            result=-result;
        }
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.2f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"sqrt"]){
        
        double num=[self.calculator.calStr doubleValue];
        double result=sqrt(num);
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.2f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"1/x"]){
        
        float x=[self.calculator.calStr floatValue];
        float result=0;
        if(x!=0)
        {
            result=1/x;
           
            
        }
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"x^2"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=pow(x, 2.0);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"x^3"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=pow(x, 3.0);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"sin"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=sin(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"cos"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=cos(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"tan"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=tan(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"asin"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=asin(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"acos"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=acos(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"atan"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=atan(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"ln"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=log(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"sinh"]){
        
        double x=[self.calculator.calStr doubleValue]/360.0*2*3.141592654;
        double result=sin(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"cosh"]){
        
        double x=[self.calculator.calStr doubleValue]/360.0*2*3.141592654;
        double result=cos(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"tanh"]){
        
        double x=[self.calculator.calStr doubleValue]/360.0*2*3.141592654;
        double result=tan(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }else if([text isEqualToString:@"log"]){
        
        double x=[self.calculator.calStr doubleValue];
        double result=log10(x);
        
        [self clearCal];
        [self addStr:[NSString stringWithFormat:@"%.8f",result]];
        
        self.textTxt.text=self.calculator.screen;
        
    }


    
    
    //3.141592654
    
    
}

-(void)clearCal
{
    [self.calculator.calStr deleteCharactersInRange:NSMakeRange(0, [self.calculator.calStr length])];
    [self.calculator.screen deleteCharactersInRange:NSMakeRange(0, [self.calculator.screen length])];
}

-(void)addStr:(NSString *)str
{
    
    [self.calculator.calStr appendString:str];
    [self.calculator.screen appendString:str];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    NSString *str=self.calculator.screen;
    self.textTxt.text=str;
    NSLog(@"hhh here coming");
    NSLog(@"str is%@",str);

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
