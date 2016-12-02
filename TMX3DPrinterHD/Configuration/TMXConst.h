

#define APPScale [UIScreen mainScreen].bounds.size.width/1024

extern const CGFloat ScreenLW;    ///<横屏的宽度
extern const CGFloat ScreenPW;    ///<竖屏的宽度
extern const CGFloat ScreenLH;    ///<横屏的高度
extern const CGFloat ScreenPH;    ///<竖屏的高度


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#define kLeftTabBarLW 80
#define kLeftTabBarPW 80
#define kLeftTabBarLH ScreenLH
#define kLeftTabBarPH ScreenPH

#define kRightCollectionViewLW ScreenLW-kLeftTabBarLW-30
#define kRightCollectionViewPW ScreenPW-kLeftTabBarPW-30
#define kRightCollectionViewLH ScreenLH-84
#define kRightCollectionViewPH ScreenPH-84


#define Lanscape (([UIScreen mainScreen].bounds.size.width ==1024) && ([UIScreen mainScreen].bounds.size.height ==768)) || (([UIScreen mainScreen].bounds.size.width ==1366) && ([UIScreen mainScreen].bounds.size.height ==1024))

#define Portrait ([UIScreen mainScreen].bounds.size.height ==ScreenPW*APPScale)


#define RGBColor(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBAColor(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define backGroundColor [UIColor colorWithRed:246/255.0 green:245/255.0 blue:246/255.0 alpha:1.0]
#define systemColor [UIColor colorWithRed:237/255.0 green:109/255.0 blue:0 alpha:1.0]
#define ServerError [NSString stringWithFormat:@"服务器出错啦!"] 

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define ShareApp ((AppDelegate *)[[UIApplication sharedApplication] delegate])


#ifdef DEBUG
#define LRString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define LRLog(...) printf("%s: %s 第%d行: %s\n\n",[[NSString lr_stringDate] UTF8String], [LRString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
#define LRLog(...)
#endif
