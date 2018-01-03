//
//  ViewController.m
//  HengTableView
//
//  Created by Mr Qian on 15/7/1.
//  Copyright (c) 2015年 Mr Qian. All rights reserved.
//

#import "ViewController.h"

#define LandScape 1  //是否为横的，1表示横的，0表示竖的

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.backgroundColor=[UIColor redColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.pagingEnabled = YES;
    NSLog(@"11111self.tableview的frame=%@",NSStringFromCGRect(self.tableView.frame));
    if (LandScape) {
        self.tableView.transform = CGAffineTransformMakeRotation(-M_PI/2);
        NSLog(@"22222self.tableview的frame=%@",NSStringFromCGRect(self.tableView.frame));
        
        
        self.tableView.frame = self.view.bounds;
        NSLog(@"333333self.tableview的frame=%@",NSStringFromCGRect(self.tableView.frame));
    }
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClicked
{
    NSLog(@"点击了...");
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    static NSString *reuseIndentifier = @"reuseIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
        if (LandScape) {
            cell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
        }
        
//        //下面的都不起作用？？？？
        cell.contentView.backgroundColor = (indexPath.row%2)==0 ? [UIColor whiteColor] : [UIColor yellowColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"点击选中" forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 40, 100, 40);
        [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:button];
    }
    
    return cell;
}
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell
forRowAtIndexPath: (NSIndexPath*)indexPath
{
//        cell.contentView.backgroundColor = (indexPath.row%2)==0 ? [UIColor whiteColor] : [UIColor yellowColor];
    if (indexPath.row%2==0)
    {
        cell.imageView.image = [UIImage imageNamed:@"IMG_2163.JPG"];//设置cell左边的图片
        cell.contentView.backgroundColor=[UIColor greenColor];

    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"IMG_2164.JPG"];

        cell.contentView.backgroundColor=[UIColor yellowColor];

    }
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (LandScape) {
        return tableView.frame.size.width;
    }
    
    return tableView.frame.size.height;
}


#pragma mark - UIScrollViewDelegate
// 用户直接滑动NSScrollView，可以看到滑动条
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (LandScape) {
        // 当前页
        int currentIndex = floor(scrollView.contentOffset.y/scrollView.frame.size.width);
        NSLog(@"%d", currentIndex);
    }
    else {
        // 当前页
        int currentIndex = floor(scrollView.contentOffset.y/scrollView.frame.size.height);
        NSLog(@"%d", currentIndex);
    }
}

@end
