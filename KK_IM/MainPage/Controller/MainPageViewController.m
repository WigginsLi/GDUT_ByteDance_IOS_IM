//
//  MainPageViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "MainPageViewController.h"

#import "ChatModel.h"

#import "KKNetConnect+messege.h"
#import "infoArchive.h"

@interface MainPageViewController () <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *chatTableView;
@property (strong, nonatomic) NSMutableArray* chatList;

@end

@implementation MainPageViewController

// 懒加载
- (NSMutableArray *) chatList {
    if (!_chatList) {
        _chatList = [NSMutableArray array];
    }
    return _chatList;
}

//- (void) addChatInfoWithChat: (ChatModel *)chatInfo{
//
//    [self.chatTableView reloadData];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.chatTableView.dataSource = self;
    NSLog(@"主界面");
    
    // 定义一个定时器，约定两秒之后调用self的run方法
    NSTimer *timer = [NSTimer timerWithTimeInterval:5.0 target:self selector:@selector(reloadHistory) userInfo:nil repeats:YES];

    // 将定时器添加到当前RunLoop的NSDefaultRunLoopMode下
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
//    [self reloadHistory];

}

#pragma mark -加载历史信息
-(void) reloadHistory{
    KKNetConnect* conn = [[KKNetConnect alloc]initWithUrl:@"https://qcxr62.fn.thelarkcloud.com/getChatList"];
    
    infoArchive* unarchiver = [[infoArchive alloc]init];
    UserInfoModel* myInfo = [unarchiver unarchiveMyInfo];
    
    NSLog(@"刷新消息列表");
    [self.chatList  removeAllObjects];
    [conn getMessegeList:myInfo.userId finishBlock:^(NSDictionary * _Nonnull dict) {
        
        NSLog(@"%@",dict[@"resultList"]);
        
        NSArray* tempArr = dict[@"resultList"];
        
        for (NSArray* d in tempArr) {
            ChatModel* chatmodel = [[ChatModel alloc]initWithDict:d[0]];
            
            [self.chatList addObject:chatmodel];
        }
        //刷新界面
        [self.chatTableView reloadData];
    }];
}

// 每个cell的内容
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString* cellid = @"chatCell";
    
    // 从缓存池中找
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellid];
    
    infoArchive* unarchiver = [[infoArchive alloc]init];
    UserInfoModel* myInfo = [unarchiver unarchiveMyInfo];
    
    NSString* oppositeUserId;
    if (myInfo.userId == [self.chatList[indexPath.row] senderId]) {
        oppositeUserId =[self.chatList[indexPath.row] receiverId];
    }else {
        oppositeUserId =[self.chatList[indexPath.row] senderId];
    }
    
    int64_t unreadCount = [self.chatList[indexPath.row] unreadCount];
    
    cell.textLabel.text = [NSString stringWithFormat:@"对方的昵称[%@]", oppositeUserId];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"[有%lld条未读消息]%@", unreadCount, [self.chatList[indexPath.row] lastMessages]];
    
    return cell;
}

// 单组table有多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatList.count;
}

@end
