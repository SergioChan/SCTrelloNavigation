//
//  TrelloListView.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "TrelloListItem.h"
#import "TrelloListTableView.h"
#import "TrelloListIconView.h"
#import "TrelloListTableViewCell.h"
#import "TrelloListCellItem.h"

@interface TrelloListView : UIScrollView <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) NSMutableArray *reusableTableViewArray;
@property (strong, nonatomic) NSMutableArray *visibleTableViewArray;

@property (strong, nonatomic) TrelloListTableView *tableView;

@property (strong,nonatomic) NSMutableArray *listItems;
@property (nonatomic) NSInteger currentIndex;

@property (nonatomic) CGFloat originTop;
@property (nonatomic) BOOL isFoldMode;

@property (copy) void (^HeaderDidFoldedCallBack)();

- (id)initWithFrame:(CGRect)frame index:(NSInteger)index listArray:(NSArray *)listItems;
@end
