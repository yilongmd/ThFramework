//
//  ViewController.m
//  ThFrameworkPods
//
//  Created by syl on 16/4/11.
//  Copyright © 2016年 Tihom-syl. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
//#import "FBKVOController.h"
#import "Studio.h"
#import "LoginController.h"
#import "LoginActivity.h"
#import "NSObject+RACPropertySubscribing.h"
#import "RACSignal+Operations.h"
//#import <KVOController/KVOController.h>

@interface ViewController ()

@end

@implementation ViewController {
//    FBKVOController *fbkvoController;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"AAAA:%@", data);
    self.title
            = @"TEST";

    NSMutableArray *listArray
            = [[NSMutableArray alloc] initWithCapacity:5];
    [listArray
            addObject:@"FBKVOController"];

    personOne
            = [[Person alloc] init];
    personOne.pName
            = @"defaultName";

    [RACObserve(personOne, pName)
            subscribeNext:^(NSString* x){
                self.title = x;
            }];
}

- (void)updateClockWithDateChange:(NSString *)str {
    NSLog(@"AAAA:%@", data);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btntestclick:(UIButton *)sender {
    data = [NSString stringWithFormat:@"%@%@", data, @"-xxx"];
    NSLog(@"new--> %@",data);
    int nums
            = arc4random()%10;
    personOne.pName
            = [NSString stringWithFormat:@"inject_newName%d",nums];
    NSLog(@"new--> %@",personOne.pName);

    controller = [[LoginActivity alloc] init];

    [self.navigationController pushViewController:controller animated:YES];

}
@end
