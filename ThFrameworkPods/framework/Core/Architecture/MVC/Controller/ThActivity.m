//
//  ThActivity.m
//  ThFrameworkPods
//
//  Created by syl on 16/4/12.
//  Copyright © 2016年 Tihom-syl. All rights reserved.
//  动画没有添加
//

#import "ThActivity.h"
#import "MBProgressHUD.h"

@interface ThActivity ()

@end

@implementation ThActivity


+ (instancetype)alloc {
    return [super alloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {

    }

    return self;
}


- (void)dealloc {
    //视图被销毁，此处需要对你在init和viewDidLoad中创建的对象进行释放
    [self onDestroy];
}


- (void)loadView {
    [super loadView];
    // 从nib载入视图 ，通常这一步不需要去干涉。除非你没有使用xib文件创建视图
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self onStart];
    [self onCreate];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //视图将出现在屏幕之前，马上这个视图就会被展现在屏幕上了
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //视图已在屏幕上渲染完成
    [self onReStart];
    [self onResume];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //视图将被从屏幕上移除之前执行
    [self onPause];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //视图已经被从屏幕上移除，用户看不到这个视图了
    [self onStop];
}


-(void)onCreate {

}

-(void) onStart {

}

-(void) onReStart {

}

-(void) onStop {

}

-(void) onPause {

}

-(void) onResume {

}

-(void) onDestroy {

}

- (void)StartModeNavVC:(UIViewController *)viewController {
    UINavigationController *nv = [[UINavigationController alloc]
            initWithRootViewController:viewController];
    [self presentViewController:nv animated:YES completion:nil];
}

- (void)showLoading {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideLoading {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)selfFinish {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)selfDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)selfPop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)selfPopRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)showErrorMsg:(NSString *)sMsg {
//    [TSMessage showNotificationInViewController:self title:@"错误" subtitle:sMsg type:TSMessageNotificationTypeError];
//    [SVProgressHUD showErrorWithStatus:sMsg];
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)showSuccessMsg:(NSString *)sMsg {
//    [TSMessage showNotificationInViewController:self title:@"成功" subtitle:sMsg type:TSMessageNotificationTypeSuccess];
//    [SVProgressHUD showSuccessWithStatus:sMsg];
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)showMessageMsg:(NSString *)sMsg {
//    [TSMessage showNotificationInViewController:self title:@"消息" subtitle:sMsg type:TSMessageNotificationTypeMessage];
//    [SVProgressHUD showInfoWithStatus:sMsg];
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)showWarningMsg:(NSString *)sMsg {
//    [TSMessage showNotificationInViewController:self title:@"提醒" subtitle:sMsg type:TSMessageNotificationTypeWarning];
//    [SVProgressHUD showSuccessWithStatus:sMsg];
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
