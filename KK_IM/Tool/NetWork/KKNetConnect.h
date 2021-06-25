//
//  KKNetConnect.h
//  KK_IM
//
//  Created by Admin on 2021/6/24.
//
#import <AFNetworking.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKNetConnect : NSObject
#pragma mark -方法
-(instancetype) initWithUrl:(NSString*)url;

//判断用户是否存在，
//@pram userAccount 账号，finishBlock 获取返回结果后的操作。
- (void)senduserAccountCheckIfExists:(NSString *)account finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

#pragma mark -属性


@end


NS_ASSUME_NONNULL_END
