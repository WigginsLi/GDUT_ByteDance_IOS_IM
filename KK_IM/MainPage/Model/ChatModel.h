//
//  ChatModel.h
//  KK_IM
//
//  Created by Wigginsli on 2021/6/23.
//

#ifndef ChatModel_h
#define ChatModel_h

enum ChatType{
    PRIVATE,
    PUBLIC,
};

@interface ChatModel : NSObject

@property (nonatomic, assign) enum ChatType *type;
@property (nonatomic, copy) NSString *senderId;
@property (nonatomic, copy) NSString *receiverId;
@property (nonatomic, copy) NSString *lastMessages;

@end

#endif /* ChatModel_h */
