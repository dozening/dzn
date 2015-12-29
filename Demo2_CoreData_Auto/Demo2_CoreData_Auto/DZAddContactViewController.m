//
//  DZAddContactViewController.m
//  Demo2_CoreData_Auto
//
//  Created by tarena on 15/12/28.
//  Copyright © 2015年 dozening. All rights reserved.
//

#import "DZAddContactViewController.h"
#import "Contact.h"

@interface DZAddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signatureTextField;

@end

@implementation DZAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickCancel:(id)sender {
}
- (IBAction)clickSave:(id)sender {
    //拿到上下文对象
    NSManagedObjectContext* context = self.resultsController.managedObjectContext;
    //insertNewObject创建空的模型对象
    Contact* contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    //设置名字/签名
    contact.name = self.nameTextField.text;
    contact.signature = self.signatureTextField.text;
    //保存数据库中
    NSError* error = nil;
    if (![context save:&error]){
        NSLog(@"插入失败:%@", error.userInfo);
    }
    //收回
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
