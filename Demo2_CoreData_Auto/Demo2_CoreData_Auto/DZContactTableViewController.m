//
//  DZContactTableViewController.m
//  Demo2_CoreData_Auto
//
//  Created by tarena on 15/12/28.
//  Copyright © 2015年 dozening. All rights reserved.
//

#import "DZContactTableViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "DZAddContactViewController.h"

@interface DZContactTableViewController ()<NSFetchedResultsControllerDelegate>

//上下文
@property (nonatomic, strong) NSManagedObjectContext* context;
//结果控制器
@property (nonatomic, strong) NSFetchedResultsController* resultsController;

@end

@implementation DZContactTableViewController
- (NSManagedObjectContext *)context{
    if (!_context) {
        AppDelegate* delegate = [UIApplication sharedApplication].delegate;
        _context = delegate.managedObjectContext;
    }
    return _context;
}
//使用懒加载

- (NSFetchedResultsController *)resultsController{
    if (_resultsController != nil) {
        return _resultsController;
    }
    //结果控制器为空的初始化逻辑
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Contact"];
    //坑：
    NSSortDescriptor* sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sort];
    _resultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:self.context sectionNameKeyPath:@"name" cacheName:@"CacheName"];
    
    //执行request(具有监听的能力)
    NSError* error = nil;
    if (![_resultsController performFetch:&error]) {
        NSLog(@"监听失败:%@", error.userInfo);
    }
    
    
    return _resultsController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //验证
    NSLog(@"resultController:%@", self.resultsController);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)clickAdd:(id)sender {
    //创建一个addContact
    DZAddContactViewController* contactViewController = [DZAddContactViewController new];
    //传结果控制器对象(获取上下文、实体)
    contactViewController.resultsController = self.resultsController;
    
    [self presentViewController:contactViewController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
