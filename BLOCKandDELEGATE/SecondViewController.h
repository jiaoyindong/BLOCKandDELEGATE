//
//  SecondViewController.h
//  BLOCKandDELEGATE
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 焦胤栋. All rights reserved.
//

#import "BaseViewController.h"

//delegate
@protocol sendMassageDelegate <NSObject>
//代理方法
- (void)sendMassage:(NSString *)massage;
@end

//block
typedef void(^BlockSend)(NSString *string);

@interface SecondViewController : BaseViewController


#pragma mark - block 传值
//<1>一种.h 里的成员变量 <2>一种.m 里声明block的成员变量
//@property (nonatomic,copy) BlockSend block;

//(1)一种重写init方法
//- (id)initWithBlock:(BlockSend)block;
//(2)(2)一种方法传值
- (void)sendBlock:(BlockSend)block;

#pragma mark - delegate 传值

//主动方要声明一个遵守协议的id类型的属性
@property (nonatomic,assign) id<sendMassageDelegate>delegate;
//重写init方法建立代理关系
- (id)initWithDelegate:(id<sendMassageDelegate>)delegate;


@end
