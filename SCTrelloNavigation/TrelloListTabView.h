//
//  TrelloListTabView.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrelloListItem.h"
#import "GlobalHeader.h"
#import "TrelloListItemView.h"

@interface TrelloListTabView : UIScrollView

@property (strong,nonatomic) NSMutableArray *listItems;
@property (strong,nonatomic) NSMutableArray *listItemViews;
@property (nonatomic) NSInteger selectedIndex;

/**
 *  是否是缩略图模式 BOOL value to indicate whether the tab view is in brief mode or not.
 */
@property (nonatomic) BOOL isBriefMode;

/**
 *  是否是折叠模式 BOOL value to indicate whether the tab view is folded or not.
 */
@property (nonatomic) BOOL isFoldedMode;

@property (copy) void (^HeaderDidSwitchCallBack)();

- (id)initWithFrame:(CGRect)frame withListArray:(NSArray *)listItems;
- (void)selectBoardAtIndex:(NSInteger)index;
- (void)reloadData;
@end
