//
//  WeightViewController.m
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/30.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import "WeightViewController.h"
@interface WeightViewController ()
@property (weak, nonatomic) IBOutlet UITextField *HeightTxt;
@property (weak, nonatomic) IBOutlet UITextField *WeightTxt;

@property (weak, nonatomic) IBOutlet UILabel *AdviceLabel;
@property (weak, nonatomic) IBOutlet UILabel *WeightLabel;
@end

@implementation WeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)weightCal:(UIButton *)sender {
    
    NSString *temp=self.HeightTxt.text;
    double height=[temp doubleValue];
    temp=self.WeightTxt.text;
    double weight=[temp doubleValue];
    NSLog(@"h:%f w:%f",height,weight);
    double result=weight/pow(height/100, 2.0);
    NSLog(@"r:%f",result);

    int rc=result;
    
    self.WeightLabel.text=[NSString stringWithFormat:@"%d",rc];
    if(rc<19)
    {
        self.AdviceLabel.text=[NSString stringWithFormat:@"太瘦了 能再多吃点嘛"];

    }else if(rc>=19 && rc <25)
    {
        
         self.AdviceLabel.text=[NSString stringWithFormat:@"黄金比例 苗条的身材 请保持"];
    }else if(rc>=25 && rc <30)
    {
        
        self.AdviceLabel.text=[NSString stringWithFormat:@"婴儿肥 注意饮食哦"];
    }else if(rc>=30 && rc <39)
    {
        
        self.AdviceLabel.text=[NSString stringWithFormat:@"太胖了 请减肥"];
    }else
    {
         self.AdviceLabel.text=[NSString stringWithFormat:@"你是超级人类 赶紧去减肥"];
    }
}


@end
