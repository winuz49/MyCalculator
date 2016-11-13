//
//  ViewController.m
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
@interface ViewController ()
@property Calculator *calculator;
@property (weak, nonatomic) IBOutlet UITextField *resultText;



@end


// TODO 使用TextView实现多行显示
@implementation ViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showAndvanced"])
    {
//        if([segue.destinationViewController isKindOfClass:[SecondViewController class]])
//        {
//            SecondViewController *sc=(SecondViewController *)segue.destinationViewController;
//            sc.screen=self.str;
//        }
    }
    
}



- (IBAction)sendSign:(UIButton *)sender {
    
    NSString *text=[[sender titleLabel] text];
    if([text isEqualToString:@"×"])
    {
        [self.calculator.calStr appendFormat:@"*"];
        
    }else if([text isEqualToString:@"÷"])
    {
        [self.calculator.calStr appendFormat:@"/"];
        
    }else{
        
        [self.calculator.calStr appendFormat:@"%@",text];
    }
    
    
    
//    if (self.resultText.text.length == 13) {
//        NSMutableString *str = [NSMutableString stringWithString:self.calculator.calStr];
//        //[str appendString:[[sender titleLabel] text]];//str由input初始化，已经加入了按钮的字符
//        NSLog(@"inputtxt=13, str is %@", str);
//        self.calculator.screen = str;
//        self.resultText.text = [str substringWithRange:NSMakeRange(str.length - 13, 13)];
//    }else{
//        NSMutableString *str = [NSMutableString stringWithString:self.resultText.text];
//        [str appendString:[[sender titleLabel] text]];
//        NSLog(@"inputtxt<13, str is %@", str);
//        self.calculator.screen = str;
//        self.resultText.text = str;
//    }
    
    NSMutableString *str = [NSMutableString stringWithString:self.resultText.text];
    [str appendString:text];
    NSLog(@"inputtxt<13, str is %@", str);
    self.calculator.screen = str;
    self.resultText.text = str;
    
    
    NSLog(@"It's first view touching.");
    NSLog(@"cal.input is %@", self.calculator.calStr);
    NSLog(@"inputText is %@", self.resultText.text);
    NSLog(@"screen is %@", self.calculator.screen);
    
}

- (IBAction)clearText:(UIButton *)sender {
    
    self.resultText.text=@"";
    self.calculator.calStr=[NSMutableString stringWithFormat:@""];
    self.calculator.screen=[NSMutableString stringWithFormat:@""];

}


- (IBAction)deleteSign:(id)sender {
    
    NSMutableString *content=[NSMutableString stringWithFormat:@"%@",self.resultText.text];
    self.resultText.text=[content substringToIndex:([content length]-1)];
    [self.calculator.calStr substringToIndex:([self.calculator.calStr length]-1)];
}



- (IBAction)calculate:(UIButton *)sender {
    
//    self.resultText.text=[self.calculator Calculate:[NSString stringWithFormat:@"1.2+3.4"]];
    NSString * result=[self.calculator Calculate];
    self.resultText.text=result;
    self.calculator.calStr=[NSMutableString stringWithFormat:@"%@",result];
    self.calculator.screen=[NSMutableString stringWithFormat:@"%@",result];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calculator=[[Calculator alloc] init];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
