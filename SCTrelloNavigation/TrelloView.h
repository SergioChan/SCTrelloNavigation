//
//  TrelloView.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "TrelloListTabView.h"
#import "TrelloListView.h"
#import "TrelloListTableView.h"

@interface TrelloView : UIView <UIScrollViewDelegate>

@property (nonatomic,strong) TrelloListTabView *tabView;
@property (nonatomic,strong) TrelloListView *listView;
@property (nonatomic) BOOL isFoldedMode;

- (id)initWithFrame:(CGRect)frame listArray:(NSArray *)listItems;
- (void)switchMode;
@end
