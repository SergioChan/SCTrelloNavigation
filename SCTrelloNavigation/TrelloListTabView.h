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

@property (nonatomic) BOOL isBriefMode;
@property (nonatomic) BOOL isFoldedMode;

@property (copy) void (^HeaderDidSwitchCallBack)();

- (id)initWithFrame:(CGRect)frame withListArray:(NSArray *)listItems;
- (void)selectBoardAtIndex:(NSInteger)index;
@end
