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
#import "IKit.h"


//加入HTML+CSS UI
@interface ThActivity : ITable

//子类对象
@model(id ,me);

/**
 *  Controller 创建
 */
-(void) onCreate;

/**
 *  Controller 开始
 */
-(void) onStart;

/**
 *  Controller 重新开始
 */
-(void) onReStart;

/**
 *  Controller 停止被覆盖后
 */
-(void) onStop;

/**
 *  Controller 还没被覆盖暂停
 */
-(void) onPause;
/**
 *  Controller 重新运行
 */
-(void) onResume;
/**
 *  Controller 释放
 */
-(void) onDestroy;


/**
 *  打开一个模态viewController
 *
 *  @param viewController viewController description
 */
/**
 *  打开一个模态viewController
 *
 *  @param viewController viewController description
 */
- (void)StartModeNavVC:(UIViewController *)viewController;

/**
 *  showLoading 唤醒正在加载
 */
- (void)showLoading;

/**
 *  hideLoading 隐藏正在加载
 */
- (void)hideLoading;

/**
 *  selfFinish 关闭
 */
- (void)selfFinish;

/**
 *  selfDismiss 关闭
 */
- (void)selfDismiss;

/**
 *  selfPop 返回上一级
 */
- (void)selfPop;

/**
 *  selfPopRoot 返回最上级
 */
- (void)selfPopRoot;

/**
 *  getData 获取数据
 */
- (void)getData;

/**
 *  setNavBackItem 设置导航栏返回按钮
 */
- (void)setNavBackItem;

/**
 *  onNavBackItemClick 导航栏返回按钮被单击
 */
- (void)onNavBackItemClick;

/**
 *  onDismissViewController 关闭ViewController
 */
- (void) closeActivity;

/**
 *  onDismissViewControllerNotAnimated 关闭ViewController不带动画
 */
- (void) closeActivityNotAnimated;

/**
 *  弹下错误通知消息
 *
 *  @param sMsg 文本消息
 */
- (void) showErrorMsg:(NSString *) sMsg;

/**
 *  弹下成功通知消息
 *
 *  @param sMsg 文本消息
 */
- (void) showSuccessMsg:(NSString *) sMsg;

/**
 *  弹下消息通知消息
 *
 *  @param sMsg 文本消息
 */
- (void) showMessageMsg:(NSString *) sMsg;

/**
 *  弹下提醒通知消息
 *
 *  @param sMsg 文本消息
 */
- (void) showWarningMsg:(NSString *) sMsg;
@end
