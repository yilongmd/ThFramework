//
//  ViewController.h
//  ThFrameworkPods
//
//  Created by syl on 16/4/11.
//  Copyright © 2016年 Tihom-syl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThKOVController.h"

@class Person;

@interface ViewController : UIViewController
{
    NSString *data;

    Person  *personOne;
    ThKOVController *ThKVO;
}

- (IBAction)btntestclick:(UIButton *)sender;
@end

