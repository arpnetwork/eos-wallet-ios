//
//  NSObject+ToolClass.h
//
//  wallet-ios
//
//  Created by fresh on 12-9-12.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#if DEBUG
#define ILog(x, ...) NSLog(x, ## __VA_ARGS__);
#else
#define ILog(x, ...)
#endif

#define MAINSCREEN [[UIScreen mainScreen] bounds]
#define SCREEN_WIDTH MAINSCREEN.size.width
#define SCREEN_HEIGHT MAINSCREEN.size.height
/**
 *  window object
 */
#define WINDOW [[[UIApplication sharedApplication] delegate] window]

#define IS_IPHONE_X (SCREEN_HEIGHT == 812.0f)

#define NavBarHeight (IS_IPHONE_X ? 88.0f : 64.0f)
#define StatusBarHeight (IS_IPHONE_X ? 44.0f : 20.0f)

//style
#import "UIColor+Util.h"
#define BaseColor [UIColor colorWithHex:0x3d7cf5]
#define BgColor [UIColor colorWithHex:0xf3f3f8]

#define TRIMSTR(str) [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]
#define ISEMPTY(str) ((!str || str.length == 0) ? YES : NO)

//获取本地图片的路径
#define GETIMG(name)  [UIImage imageWithContentsOfFile: [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name]]
//获取屏幕
#define MAINSCREEN [[UIScreen mainScreen] bounds]
//屏幕宽度
#define WIDTH MAINSCREEN.size.width
//屏幕高度
#define HEIGHT MAINSCREEN.size.height
//判断是否为iPhone5
#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 安全释放
#define SAFETY_RELEASE(x)   {[(x) release]; (x)=nil;}

//主页面Frame，去除titleBars
#define MainViewFrame CGRectMake(0,self.titleBar.frame.size.height + self.titleBar.frame.origin.y ,self.view.frame.size.width,self.view.frame.size.height - self.titleBar.frame.size.height - 20)

#define MODEL [[UIDevice currentDevice] model]
#define SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]
#define IOS7 SYSTEM_VERSION >= 7.0f
#define IOS8 SYSTEM_VERSION >= 8.0f
#define IOS8_4 SYSTEM_VERSION >= 8.4f

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

///////////////////////////Begin: Function Macro definition/////////////////////////
/**
 *  __weak self define
 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/**
 *  object is not nil and null
 */
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))

/**
 *  object is nil or null
 */
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqual:[NSNull class]]))

/**
 *  string is nil or null or empty
 */
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

/**
 *  Array is nil or null or empty
 */
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

/**
 *  validate string
 */
#define VALIDATE_STRING(str) (IsNilOrNull(str) ? @"" : str)

/**
 *  update string
 */
#define UPDATE_STRING(old, new) ((IsNilOrNull(new) || IsStrEmpty(new)) ? old : new)

/**
 *  validate NSNumber
 */
#define VALIDATE_NUMBER(number) (IsNilOrNull(number) ? @0 : number)

/**
 *  update NSNumber
 */
#define UPDATE_NUMBER(old, new) (IsNilOrNull(new) ? old : new)

/**
 *  validate NSArray
 */
#define VALIDATE_ARRAY(arr) (IsNilOrNull(arr) ? [NSArray array] : arr)


/**
 *  validate NSMutableArray
 */
#define VALIDATE_MUTABLEARRAY(arr) (IsNilOrNull(arr) ? [NSMutableArray array] :     [NSMutableArray arrayWithArray: arr])


/**
 *  update NSArray
 */
#define UPDATE_ARRAY(old, new) (IsNilOrNull(new) ? old : new)

/**
 *  update NSDate
 */
#define UPDATE_DATE(old, new) (IsNilOrNull(new) ? old : new)

/**
 *  validate bool
 */
#define VALIDATE_BOOL(value) ((value > 0) ? YES : NO)

/**
 *  Url transfer
 */
#define String_To_URL(str) [NSURL URLWithString: str]

/**
 *  nil turn to null
 */
#define Nil_TURNTO_Null(objc) (objc == nil ? [NSNull null] : objc)
///////////////////////////End: Function Macro definition/////////////////////////


