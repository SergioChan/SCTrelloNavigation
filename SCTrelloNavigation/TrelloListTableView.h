//
//  TrelloListTableView.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/6.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrelloListItem.h"
#import "SCTrelloHeader.h"

@interface TrelloListTableView : UITableView

@property (nonatomic, strong) TrelloListItem *listItem;
@property (nonatomic, strong) UIView *trelloListHeaderView;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style listItem:(TrelloListItem *)item;
@end
