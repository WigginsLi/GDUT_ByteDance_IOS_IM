//
//  KKNetConnect.m
//  KK_IM
//
//  Created by Admin on 2021/6/24.
//

#import "KKNetConnect.h"


@interface KKNetConnect ()
#pragma mark -属性
@property (nonatomic, strong)AFHTTPSessionManager* manager;
@property (nonatomic, copy)NSString* url;


@end

#pragma mark -实现
@implementation KKNetConnect

- (AFHTTPSessionManager *)manager{
    //懒加载
    if(!_manager){
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return _manager;
}

-(instancetype) initWithUrl:(NSString*)url {
    if(self = [super init]){
        self.url = url;
    }
    
    return self;
}

-(void) sendBody:(NSDictionary*)body finishBlock:( void (^) (NSDictionary*))finish{
//    __block NSDictionary* res ;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.manager POST:self.url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            dispatch_async(dispatch_get_main_queue(), ^{
                finish(responseObject);
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"失败 : ");
        }];
    });
    
}


- (void)senduserAccountCheckIfExists:(NSString *)account finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"userId": account};
    [self sendBody:body finishBlock:finish];
}


@end
