//
//  ViewController.h
//  HengTableView
//
//  Created by Mr Qian on 15/7/1.
//  Copyright (c) 2015年 Mr Qian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

