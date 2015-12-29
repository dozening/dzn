//
//  ViewController.m
//  Day02_插件测试
//
//  Created by tarena on 15/11/30.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray* nameList;
//懒加载插件再edit 的DClazy
@property (nonatomic, strong) NSString* name;

@end

@implementation ViewController
//cell被点击以后执行的代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton* btn = [UIButton buttonWithType:0];
//
    [btn addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)nameList {//自动
	if(_nameList == nil) {
		_nameList = [[NSArray alloc] init];
	}
	return _nameList;
}

- (NSString *)name {//自动
	if(_name == nil) {
		_name = [[NSString alloc] init];
	}
	return _name;
}

@end
