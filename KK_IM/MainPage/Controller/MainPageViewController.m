//
//  MainPageViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "MainPageViewController.h"

#import "ChatModel.h"

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

- (void) addChatInfoWithChat: (ChatModel *)chatInfo{
    // TODO: 将聊天信息模型传进来并插入chatList数组
    
//    [self.chatList addObject: chatInfo];
//
//    [self.chatTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.chatTableView.dataSource = self;
    NSLog(@"主界面");
    
//    ChatModel* chatmodel = [[ChatModel alloc] init];
//    chatmodel.senderId = @"00002";
//    chatmodel.lastMessages = @"this is a test message.";
//    [self.chatList addObject: chatmodel];
}

// 每个cell的内容
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString* cellid = @"chatCell";
    
    // 从缓存池中找
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellid];
    
    cell.textLabel.text = [self.chatList[indexPath.row] senderId];
    cell.detailTextLabel.text = [self.chatList[indexPath.row] lastMessages];
    
    return cell;
}

// 单组table有多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatList.count;
}

@end
