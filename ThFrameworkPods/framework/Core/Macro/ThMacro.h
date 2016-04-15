//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSString
//  字符串：
#ifndef nilToEmpty
#define nilToEmpty(object) (object!=nil)?object:@""
#endif

//字符串初始化,没有多个Object的可以弃用,现版本可以直接=
#ifndef formatStringOfObject
#define formatStringOfObject(object) [NSString stringWithFormat:@"%@", object]
#endif

#ifndef nilToEmptyFormatStringOfObject
#define nilToEmptyFormatStringOfObject(object) formatStringOfObject(nilToEmpty(object))
#endif

#pragma mark - UIImage
//图片：
#ifndef imagePath
#define imagePath(imageName) [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]
#endif

#pragma mark - RGB
//颜色
#define RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)  RGBA(r, g, b, 1.0f)
//使用16进制的颜色
#define HEXCOLOR(c)   [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f];
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - Log
//debug log
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DLogRect(rect)  DLog(@"%s x=%f, y=%f, w=%f, h=%f", #rect, rect.origin.x, rect.origin.y,rect.size.width, rect.size.height)
#   define DLogPoint(pt) DLog(@"%s x=%f, y=%f", #pt, pt.x, pt.y)
#   define DLogSize(size) DLog(@"%s w=%f, h=%f", #size, size.width, size.height)
#   define DLogColor(_COLOR) DLog(@"%s h=%f, s=%f, v=%f", #_COLOR, _COLOR.hue, _COLOR.saturation, _COLOR.value)
#   define DLogSuperViews(_VIEW) { for (UIView* view = _VIEW; view; view = view.superview) { GBLog(@"%@", view); } }
#   define DLogSubViews(_VIEW) \
    { for (UIView* view in [_VIEW subviews]) { GBLog(@"%@", view); } }
#   else
#   define DLog(...)
#   define DLogRect(rect)
#   define DLogPoint(pt)
#   define DLogSize(size)
#   define DLogColor(_COLOR)
#   define DLogSuperViews(_VIEW)
#   define DLogSubViews(_VIEW)
#   endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

//log with UIAlertView
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif
//mark
#define MARK    NSLog(@"\nMARK: %s, %d", __PRETTY_FUNCTION__, __LINE__)


#pragma mark - Device Information
//  大小尺寸
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
//IOS支持
#define SUPPORT_IPHONE_OS_VERSION(version) ( __IPHONE_OS_VERSION_MIN_REQUIRED <= version && __IPHONE_OS_VERSION_MAX_ALLOWED >= version)
//判断是否 Retina屏、设备是否%fhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//系统版本
#define IS_IOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)? (YES):(NO))
#define IS_IOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define IS_IOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
#define IS_IOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)? (YES):(NO))
#define IS_4INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#pragma mark - System Information
//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]


//检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark - Singleton
//Application delegate
#define ApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//主要单例
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NotificationCenter                  [NSNotificationCenter defaultCenter]
#define SharedApplication                   [UIApplication sharedApplication]

#define Bundle                              [NSBundle mainBundle]

#define MainScreen                          [UIScreen mainScreen]

#pragma mark - NetWork
//网络指示
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x


#pragma mark - Main Control
//  主要控件
#define NavBar                              self.navigationController.navigationBar
#define TabBar                              self.tabBarController.tabBar
//导航控件高度
#define NavBarHeight                        self.navigationController.navigationBar.bounds.size.height
//分页控件高度
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height
#define TouchHeightDefault                  44.0f
#define TouchHeightSmall                    32.0f

#pragma mark - View
//View的属性
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y

//ViewController.view状态
#define SelfViewWidth                       self.view.bounds.size.width
#define SelfViewHeight                      self.view.bounds.size.height

#pragma mark - Rect
//Rect属性
#define RectX(rect)                            rect.origin.x
#define RectY(rect)                            rect.origin.y
#define RectWidth(rect)                        rect.size.width
#define RectHeight(rect)                       rect.size.height

//Rect属性设置
#define RectSetWidth(rect, w)                  CGRectMake(RectX(rect), RectY(rect), w, RectHeight(rect))
#define RectSetHeight(rect, h)                 CGRectMake(RectX(rect), RectY(rect), RectWidth(rect), h)
#define RectSetX(rect, x)                      CGRectMake(x, RectY(rect), RectWidth(rect), RectHeight(rect))
#define RectSetY(rect, y)                      CGRectMake(RectX(rect), y, RectWidth(rect), RectHeight(rect))

//Rect属性设置
#define RectSetSize(rect, w, h)                CGRectMake(RectX(rect), RectY(rect), w, h)
#define RectSetOrigin(rect, x, y)              CGRectMake(x, y, RectWidth(rect), RectHeight(rect))

#pragma mark - Image
//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象,//建议使用前两种宏定义,性能高于后者
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

#pragma mark - Snippet

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;
// show Alert
#define alertContent(content) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" \
message:content \
delegate:nil   \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil];  \
[alert show];  \


#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}



#pragma mark - Other
//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define FONT(x) [UIFont systemFontOfSize:x]


#pragma mark - Th Framework
#define __ON__			(1)
#define __OFF__			(0)
//#define __AUTO__		(DEBUG)
//定义一个object类型的对象
#undef	var
#define var	NSObject *

//定义一个可以设置类型的模板
#define	model( type, name ) \
		property (nonatomic, strong) type name


//在M文件里面声明的synthesize
#undef	def_model
#define	def_model( type, name, ... ) \
		synthesize name = _##name; \
		+ (NSString *)property_##name { return macro_string( macro_join(__VA_ARGS__) ); }

//现在OC已经可以支持变量之间声明在
#define	DefVar( type, name ) \
		property (nonatomic, strong) type name

#define	DefAssign( type, name ) \
		property (nonatomic, assign) type name

//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//背景色
#define TH_BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]

//清除背景色
#define CLEARCOLOR [UIColor clearColor]



//安全删除对象

#define SAFE_DELETE(P) if(P) { [P release], P = nil; }

#pragma mark -

#undef	static_property
#define static_property( __name ) \
		property (nonatomic, readonly) NSString * __name; \
		- (NSString *)__name; \
		+ (NSString *)__name;

#undef	def_static_property
#define def_static_property( __name, ... ) \
		macro_concat(def_static_property, macro_count(__VA_ARGS__))(__name, __VA_ARGS__)

#undef	def_static_property0
#define def_static_property0( __name ) \
		dynamic __name; \
		- (NSString *)__name { return [NSString stringWithFormat:@"%s", #__name]; } \
		+ (NSString *)__name { return [NSString stringWithFormat:@"%s", #__name]; }

#undef	def_static_property1
#define def_static_property1( __name, A ) \
		dynamic __name; \
		- (NSString *)__name { return [NSString stringWithFormat:@"%@.%s", A, #__name]; } \
		+ (NSString *)__name { return [NSString stringWithFormat:@"%@.%s", A, #__name]; }

#undef	def_static_property2
#define def_static_property2( __name, A, B ) \
		dynamic __name; \
		- (NSString *)__name { return [NSString stringWithFormat:@"%@.%@.%s", A, B, #__name]; } \
		+ (NSString *)__name { return [NSString stringWithFormat:@"%@.%@.%s", A, B, #__name]; }

#undef	def_static_property3
#define def_static_property3( __name, A, B, C ) \
		dynamic __name; \
		- (NSString *)__name { return [NSString stringWithFormat:@"%@.%@.%@.%s", A, B, C, #__name]; } \
		+ (NSString *)__name { return [NSString stringWithFormat:@"%@.%@.%@.%s", A, B, C, #__name]; }

#undef	alias_static_property
#define alias_static_property( __name, __alias ) \
		dynamic __name; \
		- (NSString *)__name { return __alias; } \
		+ (NSString *)__name { return __alias; }

#pragma mark -

#undef	integer
#define integer( __name ) \
		property (nonatomic, readonly) NSInteger __name; \
		- (NSInteger)__name; \
		+ (NSInteger)__name;

#undef	def_integer
#define def_integer( __name, __value ) \
		dynamic __name; \
		- (NSInteger)__name { return __value; } \
		+ (NSInteger)__name { return __value; }

#pragma mark -

#undef	unsigned_integer
#define unsigned_integer( __name ) \
		property (nonatomic, readonly) NSUInteger __name; \
		- (NSUInteger)__name; \
		+ (NSUInteger)__name;

#undef	def_unsigned_integer
#define def_unsigned_integer( __name, __value ) \
		dynamic __name; \
		- (NSUInteger)__name { return __value; } \
		+ (NSUInteger)__name { return __value; }

#pragma mark -

#undef	number
#define number( __name ) \
		property (nonatomic, readonly) NSNumber * __name; \
		- (NSNumber *)__name; \
		+ (NSNumber *)__name;

#undef	def_number
#define def_number( __name, __value ) \
		dynamic __name; \
		- (NSNumber *)__name { return @(__value); } \
		+ (NSNumber *)__name { return @(__value); }

#pragma mark - Bee

#undef	string
#define string( __name ) \
		property (nonatomic, readonly) NSString * __name; \
		- (NSString *)__name; \
		+ (NSString *)__name;

#undef	def_string
#define def_string( __name, __value ) \
		dynamic __name; \
		- (NSString *)__name { return __value; } \
		+ (NSString *)__name { return __value; }

#pragma mark -

#if __has_feature(objc_arc)

#define	prop_readonly( type, name )		property (nonatomic, readonly) type name;
#define	prop_dynamic( type, name )		property (nonatomic, strong) type name;
#define	prop_assign( type, name )		property (nonatomic, assign) type name;
#define	prop_strong( type, name )		property (nonatomic, strong) type name;
#define	prop_weak( type, name )			property (nonatomic, weak) type name;
#define	prop_copy( type, name )			property (nonatomic, copy) type name;
#define	prop_unsafe( type, name )		property (nonatomic, unsafe_unretained) type name;

#else

#define	prop_readonly( type, name )		property (nonatomic, readonly) type name;
#define	prop_dynamic( type, name )		property (nonatomic, retain) type name;
#define	prop_assign( type, name )		property (nonatomic, assign) type name;
#define	prop_strong( type, name )		property (nonatomic, retain) type name;
#define	prop_weak( type, name )			property (nonatomic, assign) type name;
#define	prop_copy( type, name )			property (nonatomic, copy) type name;
#define	prop_unsafe( type, name )		property (nonatomic, assign) type name;

#endif

@interface ThMacro : NSObject
@end