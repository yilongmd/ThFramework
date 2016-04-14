//
//  ThActivity.h
//  ThFrameworkPods
//
//  Created by syl on 16/4/12.
//  Copyright © 2016年 Tihom-syl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThMacro.h"
#import "ITable.h"

//加入HTML+CSS UI
@interface ThActivity : ITable



/**
 *  Controller 创建
 */
-(void) onCreate;

/**
 *  Controller 开始
 */
-(void) onStart;

/**
 *  Controller 创建
 */
-(void) onReStart;

-(void) onStop;

-(void) onPause;

-(void) onResume;

-(void) onDestroy;

//子类对象
@model(id ,me);

@end
