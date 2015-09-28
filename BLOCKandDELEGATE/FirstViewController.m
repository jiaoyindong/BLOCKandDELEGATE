//
//  FirstViewController.m
//  BLOCKandDELEGATE
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 焦胤栋. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()<sendMassageDelegate>
{
    UILabel *_firstLable;
    UILabel *_secondLable;
    NSString *_str;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createView{
        _firstLable = [Factory createLabelWithTitle:nil frame:CGRectMake(LeftDistance, 100, ScreenWidth-2*LeftDistance, Default)];
    _firstLable.backgroundColor = [UIColor brownColor];
        [self.view addSubview:_firstLable];
    
        _secondLable = [Factory createLabelWithTitle:nil frame:CGRectMake(LeftDistance, 160, ScreenWidth-2*LeftDistance, Default)];
    _secondLable.backgroundColor = [UIColor brownColor];
        [self.view addSubview:_secondLable];
    
        UIButton *button = [Factory createButtonWithTitle:@"SecondPage" frame:CGRectMake(LeftDistance, _secondLable.bottom+Default, ScreenWidth-2*LeftDistance, Default) target:self selector:@selector(toSecondPage)];
        [self.view addSubview:button];
}

- (void)toSecondPage{

//    SecondViewController *svc = [[SecondViewController alloc]initWithBlock:^(NSString *string) {
//        _str = string;
//        NSLog(@"%@",_str);
//    }];
    SecondViewController *svc = [[SecondViewController alloc]initWithDelegate:self];
    [svc sendBlock:^(NSString *string) {
        _firstLable.text = string;
    }];
    //必须将代理人传过去
    //svc.delegate = self;
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - delegate
- (void)sendMassage:(NSString *)massage{
    _secondLable.text = massage;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
