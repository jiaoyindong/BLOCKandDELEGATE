//
//  SecondViewController.m
//  BLOCKandDELEGATE
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 焦胤栋. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITextFieldDelegate>
{
    UITextField *_first;
    UITextField *_second;
    //<2>
    BlockSend _block;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - block 传值
//- (id)initWithBlock:(BlockSend)block{
//    self = [super init];
//    if (self) {
//        _block = block;
//    }
//    return self;
//}

- (void)sendBlock:(BlockSend)block{
    _block = block;
}

#pragma mark - delegate 代理传值
- (id)initWithDelegate:(id<sendMassageDelegate>)delegate{
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}

- (void)createView{
    _first = [Factory createViewWithText:nil frame:CGRectMake(LeftDistance, 100, ScreenWidth-2*LeftDistance, Default) placeholder:@"BLOCK传值" textColor:[UIColor blackColor] borderStyle:UITextBorderStyleRoundedRect];
    
    [self.view addSubview:_first];

    _second = [Factory createViewWithText:nil frame:CGRectMake(LeftDistance, _first.bottom, ScreenWidth-2*LeftDistance, Default) placeholder:@"DELEGATE传值" textColor:[UIColor blackColor] borderStyle:UITextBorderStyleRoundedRect];
    
    [self.view addSubview:_second];

    UIButton *button = [Factory createButtonWithTitle:@"upPage" frame:CGRectMake(LeftDistance, _second.bottom, ScreenWidth-2*LeftDistance, Default) target:self selector:@selector(toUpPage)];
    [self.view addSubview:button];
}

- (void)toUpPage{
    
    if (_block) {
        _block(_first.text);
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(sendMassage:)]) {
        [self.delegate sendMassage:_second.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
