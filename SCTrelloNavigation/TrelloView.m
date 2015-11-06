//
//  TrelloView.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloView.h"

@interface TrelloView ()
@end

@implementation TrelloView

- (id)initWithFrame:(CGRect)frame listArray:(NSArray *)listItems
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.isFoldedMode = NO;
        
        self.tabView = [[TrelloListTabView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, ScreenWidth, 100.0f) withListArray:listItems];
        _tabView.backgroundColor = Global_trelloBlue;
        [_tabView selectBoardAtIndex:0];
        
        __weak TrelloView *weakSelf = self;
        _tabView.HeaderDidSwitchCallBack = ^{
            [weakSelf switchMode];
        };
        
        [self addSubview:_tabView];
        
        self.listView = [[TrelloListView alloc]initWithFrame:CGRectMake(30.0f, _tabView.bottom - 30.0f, ScreenWidth - 45.0f, self.height - _tabView.bottom + 30.0f) index:0 listArray:listItems];
        _listView.delegate = self;
        _listView.layer.masksToBounds = NO;
        _listView.clipsToBounds = NO;
        
        _listView.HeaderDidFoldedCallBack = ^{
            if(!weakSelf.isFoldedMode)
            {
                // 展开
                for(TrelloListItemView *view in weakSelf.tabView.listItemViews)
                {
                    view.titlelabel.frame = CGRectZero;
                }
                [UIView animateWithDuration:0.3f animations:^{
                    CGFloat nextX = 70.0f;
                    
                    weakSelf.tabView.contentSize = CGSizeMake(0.0f, 35.0f);
                    weakSelf.tabView.frame = CGRectMake(0.0f, weakSelf.tabView.top, ScreenWidth, 35.0f);
                    for(TrelloListItemView *view in weakSelf.tabView.listItemViews)
                    {
                        view.frame = CGRectMake(nextX, 0.0f, 30.0f, 0.0f);
                        view.boardView.frame = CGRectMake(5.0f, 5.0f, 20.0f, 0.0f);
                        nextX += view.width;
                    }
                    
                    CGRect frame = weakSelf.listView.frame;
                    frame.origin.y = 5.0f;
                    frame.size.height = weakSelf.height - 5.0f;
                    weakSelf.listView.frame = frame;
                    
//                    for(TrelloListTableView *tableView in weakSelf.listView.visibleTableViewArray)
//                    {
//                        tableView.height = weakSelf.listView.height;
//                    }
                } completion:^(BOOL finished) {
                    weakSelf.isFoldedMode = YES;
                    weakSelf.tabView.isFoldedMode = YES;
                    weakSelf.tabView.isBriefMode = NO;
                    weakSelf.listView.isFoldMode = YES;
                }];
            }
            else
            {
                for(TrelloListItemView *view in weakSelf.tabView.listItemViews)
                {
                    view.titlelabel.frame = CGRectZero;
                }
                [UIView animateWithDuration:0.3f animations:^{
                    CGFloat nextX = 70.0f;
                    
                    weakSelf.tabView.contentSize = CGSizeMake(70.0f + weakSelf.tabView.listItems.count * 30.0f, 100.0f);
                    weakSelf.tabView.frame = CGRectMake(0.0f, weakSelf.tabView.top, ScreenWidth, 100.0f);
                    for(TrelloListItemView *view in weakSelf.tabView.listItemViews)
                    {
                        view.frame = CGRectMake(nextX, 0.0f, 30.0f, 30.0f + view.item.heightLevel * 10.0f + 20.0f);
                        view.boardView.frame = CGRectMake(5.0f, 5.0f, 20.0f, view.item.heightLevel * 10.0f);
                        nextX += view.width;
                    }
                    
                    CGRect frame = weakSelf.listView.frame;
                    frame.origin.y = weakSelf.tabView.bottom - 30.0f;
                    frame.size.height = weakSelf.height - weakSelf.tabView.bottom + 30.0f;
                    weakSelf.listView.frame = frame;
                } completion:^(BOOL finished) {
                    weakSelf.isFoldedMode = NO;
                    weakSelf.tabView.isFoldedMode = NO;
                    weakSelf.tabView.isBriefMode = YES;
                    weakSelf.listView.isFoldMode = NO;
                }];
            }
        };
        [self addSubview:_listView];
    }
    return self;
}

- (void)switchMode
{
    if(_tabView.isBriefMode)
    {
        [UIView animateWithDuration:0.3f animations:^{
            CGFloat scale = (ScreenWidth/4.5f)/30.0f;
            CGFloat nextX = 30.0f;
            
            self.tabView.contentSize = CGSizeMake(self.tabView.listItems.count * (ScreenWidth/4.5f) + 60.0f, 100.0f * scale);
            self.tabView.frame = CGRectMake(0.0f, self.tabView.top, ScreenWidth, 100.0f * scale);
            for(TrelloListItemView *view in self.tabView.listItemViews)
            {
                view.frame = CGRectMake(nextX, 0.0f, ScreenWidth/4.5f, 50.0f + view.item.heightLevel * 20.0f);
                view.titlelabel.frame = CGRectMake(ScreenWidth/27.0f, 10.0f, ScreenWidth/(4.5f * 1.5f), 25.0f);
                view.boardView.frame = CGRectMake(ScreenWidth/18.0f, view.titlelabel.bottom + 10.0f, ScreenWidth/9.0f, view.item.heightLevel * 20.0f);
                nextX += view.width;
            }
            
            self.listView.top = self.tabView.bottom - 90.0f;

        } completion:^(BOOL finished) {
            self.listView.isFoldMode = NO;
            self.isFoldedMode = NO;
            self.tabView.isBriefMode = NO;
        }];
        // 缩略图模式，变大
    }
    else
    {
        for(TrelloListItemView *view in _tabView.listItemViews)
        {
            view.titlelabel.frame = CGRectZero;
        }
        [UIView animateWithDuration:0.3f animations:^{
            CGFloat nextX = 70.0f;
            
            self.tabView.contentSize = CGSizeMake(70.0f + self.tabView.listItems.count * 30.0f, 100.0f);
            self.tabView.frame = CGRectMake(0.0f, self.tabView.top, ScreenWidth, 100.0f);
            for(TrelloListItemView *view in self.tabView.listItemViews)
            {
                view.frame = CGRectMake(nextX, 0.0f, 30.0f, 30.0f + view.item.heightLevel * 10.0f + 20.0f);
                view.boardView.frame = CGRectMake(5.0f, 5.0f, 20.0f, view.item.heightLevel * 10.0f);
                nextX += view.width;
            }
            
            self.listView.top = self.tabView.bottom - 30.0f;
            
        } completion:^(BOOL finished) {
            self.listView.isFoldMode = NO;
            self.isFoldedMode = NO;
            self.tabView.isBriefMode = YES;
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == _listView)
    {
        NSInteger x = scrollView.contentOffset.x;
        NSInteger width = ScreenWidth - 45.0f;
        if(x % width == 0)
        {
            [_tabView selectBoardAtIndex:x/width];
        }
            
        //NSLog(@"offset :%f",scrollView.contentOffset.x);
    }
}

@end
