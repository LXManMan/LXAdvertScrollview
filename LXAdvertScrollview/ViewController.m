//
//  ViewController.m
//  LXAdvertScrollview
//
//  Created by chenergou on 2018/1/4.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "LXAdvertScrollview.h"

@interface ViewController ()
@property(nonatomic,strong)LXAdvertScrollview *advertView;
@property(nonatomic,strong)NSMutableArray *dataA;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array1 = @[@"套餐1",@"套餐2",@"套餐3",@"套餐4",@"套餐5"];
    NSArray *array2 = @[@"1280元",@"1680元",@"1880元",@"1980元",@"2080元"];

    for (int i =0; i<array1.count; i++) {
        LXAdverModel *model =[[LXAdverModel alloc]init];
        model.leftTitle =  array1[i];
        
        model.rightTitle = array2[i];
        [self.dataA addObject:model];
    }
    
    self.advertView =[[LXAdvertScrollview alloc]initWithFrame:CGRectMake(0, 100, Device_Width, 50)];
   
    self.advertView.dataA = self.dataA;
    [self.view addSubview:self.advertView];
}

-(NSMutableArray *)dataA{
    if (!_dataA) {
        _dataA =[NSMutableArray array];
    }
    return _dataA;
}
@end
