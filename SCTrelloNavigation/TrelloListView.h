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

@interface TrelloListView : UIScrollView <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) NSMutableArray *reusableTableViewArray;
@property (strong, nonatomic) NSMutableArray *visibleTableViewArray;

@property (strong, nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *listItems;
@property (nonatomic) NSInteger currentIndex;

@property (nonatomic) CGFloat originTop;
@property (nonatomic) BOOL isFoldMode;

@property (copy) void (^HeaderDidFoldedCallBack)();

- (id)initWithFrame:(CGRect)frame index:(NSInteger)index listArray:(NSArray *)listItems;
@end
