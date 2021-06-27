//
//  KKNetConnect+messege.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "KKNetConnect+messege.h"

@implementation KKNetConnect (messege)

- (void)getMessegeList:(NSString *)userId finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"userId": userId};
    [self changURL:@"https://qcxr62.fn.thelarkcloud.com/getChatList"];
    [self sendBody:body finishBlock:finish];
}
@end
