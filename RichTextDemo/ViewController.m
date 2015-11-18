//
//  ViewController.m
//  RichTextDemo
//
//  Created by mac on 15/11/18.
//  Copyright © 2015年 fec. All rights reserved.
//

#import "ViewController.h"
#import "NSString+RichText.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"订单号：666631667001 |  应付金额：￥510.00 立即支付￥510.00，即可完成订单。请您在24小时内完成支付否则订单会被自动取消";
    
    NSMutableAttributedString *attributeString = [str convertAttributes:@[@{NSForegroundColorAttributeName:[UIColor grayColor]},@{NSForegroundColorAttributeName:[UIColor redColor]}] withSubStrings:@[@"666631667001",@"￥510.00"]];
    
    _textLb.attributedText = attributeString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
