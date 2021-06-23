//
//  MessageModel.h
//  KK_IM
//
//  Created by Wigginsli on 2021/6/23.
//

#ifndef MessageModel_h
#define MessageModel_h

enum MessageType{
    TEXT;
    EMOJI;
    PICTURE;
}

@interface MessageModel : NSObject

@property (nonatomic, copy) MessageType type;
@property (nonatomic, copy) NSString content;
@property (nonatomic, copy) NSString sendTime;
@property (nonatomic, copy) NSString senderId;
@property (nonatomic, copy) NSString receiverId;


@end


#endif /* MessageModel_h */
