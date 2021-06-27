//
//  settingArchive.h
//  KK_IM
//
//  Created by Admin on 2021/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface settingArchive : NSObject
//TODO: 调整系统设置的时候需要的属性
// 对系统的调整直接通过这个类进行设置，然后加载的时候，使用unarchive函数进行解档，获取相应的数据
@end

NS_ASSUME_NONNULL_END
