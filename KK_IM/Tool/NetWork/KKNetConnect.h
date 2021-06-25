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
-(void) sendBody:(NSDictionary*)body finishBlock:( void (^) (NSDictionary*))finish;

#pragma mark -属性
//@property (nonatomic, strong)NSDictionary* dict;

@end


NS_ASSUME_NONNULL_END
