//
//  ViewController.m
//  MasonryDemo
//
//  Created by 柳玉峰 on 2017/4/2.
//  Copyright © 2017年 柳玉峰. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 一、Masonry是一个轻量级的布局框架,拥有自己的描述语法，简洁明了并且具有较高的可读性。
    
    // 1.创建一个View
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor greenColor];
    // 2.使用Masonry之前一定要把'view'添加到视图上,否则会崩掉
    [self.view addSubview:view1];
    // 3.添加约束
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        // 等价于 make.left.equalTo(self.view).with.offset(10);
        // 右面是负值，
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(200);
    }];
    /**4.三个添加约束的方法
     *  - (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;
     *  a.添加新约束时使用，只负责添加
     *  - (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
     *  b.针对以前已经添加的情况进行更新，不会出现两条相同的约束的情况
     *  - (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;
     *  c.删除掉之前已经添加的约束，仅保留最新的约束
     */
    
    /**5.约束
     * left         -> NSLayoutAttributeLeft            左边距
     * top          -> NSLayoutAttributeRight           右边距
     * right        -> NSLayoutAttributeTop             上边距
     * bottom       -> NSLayoutAttributeBottom          下边距
     * leading      -> NSLayoutAttributeLeading         首部
     * trailing     -> NSLayoutAttributeTrailing        尾部
     * width        -> NSLayoutAttributeWidth           宽
     * height       -> NSLayoutAttributeHeight          高
     * centerX      -> NSLayoutAttributeCenterX         中心横轴
     * centerY      -> NSLayoutAttributeCenterY         中心纵轴
     * baseline     -> NSLayoutAttributeLastBaseline    文本基线
     */
    
    /** 6.equal相关
     *  equalTo()                   等于
     *  greaterThanOrEqualTo()      大于等于
     *  lessThanOrEqualTo()         小于等于
     *  mas_equalTo(...)                 equalTo(MASBoxValue((__VA_ARGS__)))
     *  mas_greaterThanOrEqualTo(...)    greaterThanOrEqualTo(MASBoxValue((__VA_ARGS__)))
     *  mas_lessThanOrEqualTo(...)       lessThanOrEqualTo(MASBoxValue((__VA_ARGS__)))
     *  mas_offset(...)                  valueOffset(MASBoxValue((__VA_ARGS__)))
     *  mas_equalTo只是对其参数进行了一个BOX操作(装箱)
     */
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor redColor];
    [view1 addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view1).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        // 等价于
        // make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        // 等价于
        // make.top.mas_equalTo(10);
        // make.left.mas_equalTo(10);
        // make.bottom.mas_equalTo(-10);
        // make.right.mas_equalTo(-10);
        // 等价于
        // make.top.left.bottom.and.right.equalTo(view1).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
