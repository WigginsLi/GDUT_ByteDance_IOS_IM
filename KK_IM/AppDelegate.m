//
//  AppDelegate.m
//  KK_IM
//
//  Created by Admin on 2021/6/23.
//

#import "AppDelegate.h"
#import "KKNetConnect.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

//    KKNetConnect* conn = [[KKNetConnect alloc]initWithUrl:@"https://qczgqv.fn.thelarkcloud.com/AddUser"];
//    [conn senduserNickName:@"haha" andUserId:@"00004" andPassword:@"00004" finishBlock:^(NSDictionary * _Nonnull res) {
//        NSLog(@"%@", res);
//    }];
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
