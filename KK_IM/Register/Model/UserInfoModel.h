//
//  UserInfoModel.h
//  KK_IM
//
//  Created by Wigginsli on 2021/6/23.
//

#ifndef UserInfoModel_h
#define UserInfoModel_h

@interface UserInfoModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *deviceToken;
@property (nonatomic, copy) NSArray *friends;

@end

#endif /* UserInfoModel_h */
