//
//  TrelloListView.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListView.h"

@implementation TrelloListView

- (id)initWithFrame:(CGRect)frame index:(NSInteger)index listArray:(NSArray *)listItems
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;

        self.contentSize = CGSizeMake(listItems.count * (ScreenWidth - 45.0f), self.height);
        self.contentOffset = CGPointMake(0.0f, 0.0f);
        
        self.pagingEnabled = YES;
        self.originTop = self.top;
        self.isFoldMode = NO;
        self.bouncesZoom = NO;
        self.bounces = YES;
        self.alwaysBounceVertical = NO;
        self.alwaysBounceHorizontal = NO;
        self.layer.masksToBounds = NO;
        self.clipsToBounds = NO;
        
        self.reusableTableViewArray = [NSMutableArray array];
        self.visibleTableViewArray = [NSMutableArray array];
        self.currentIndex = index;
        
        self.listItems = [listItems mutableCopy];
        
        CGFloat nextX = 0.0f;
        for(NSInteger i=0;i<listItems.count;i++)
        {
            TrelloListTableView *t_tableView = [[TrelloListTableView alloc]initWithFrame:CGRectMake(nextX, 0.0f, ScreenWidth - 60.0f, self.height) style:UITableViewStylePlain listItem:[listItems objectAtIndex:i]];
            
            t_tableView.delegate = self;
            t_tableView.dataSource = self;
            
            [self addSubview:t_tableView];
            nextX = t_tableView.right + 15.0f;
            
            [self.visibleTableViewArray addObject:t_tableView];
        }
    }
    return self;
}

- (void)reloadData
{
    // still not implement reusable tableview... fuck...
    NSInteger currentTableViewNumber = self.visibleTableViewArray.count;
    if(self.listItems.count == currentTableViewNumber)
    {
        for(NSInteger i=0;i<currentTableViewNumber;i++)
        {
            TrelloListTableView *t_tableView = (TrelloListTableView *)[self.visibleTableViewArray objectAtIndex:i];
            t_tableView.listItem = [self.listItems objectAtIndex:i];
            [t_tableView reloadData];
        }
    }
    else if(self.listItems.count < currentTableViewNumber)
    {
        // if having less boards after reloading, remove the rests and reload the useful ones
        self.contentSize = CGSizeMake(self.listItems.count * (ScreenWidth - 45.0f), self.height);
        
        NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
        for(NSInteger i=0;i<currentTableViewNumber;i++)
        {
            if(i>=self.listItems.count)
            {
                TrelloListTableView *t_tableView = (TrelloListTableView *)[self.visibleTableViewArray objectAtIndex:i];
                [t_tableView removeFromSuperview];
                [indexSet addIndex:i];
            }
            else
            {
                TrelloListTableView *t_tableView = (TrelloListTableView *)[self.visibleTableViewArray objectAtIndex:i];
                t_tableView.listItem = [self.listItems objectAtIndex:i];
                [t_tableView reloadData];
            }
        }
        [self.visibleTableViewArray removeObjectsAtIndexes:indexSet];
    }
    else
    {
        self.contentSize = CGSizeMake(self.listItems.count * (ScreenWidth - 45.0f), self.height);
        
        for(NSInteger i=0;i<self.listItems.count;i++)
        {
            CGFloat nextX = 0.0f;
            if(i>=currentTableViewNumber)
            {
                TrelloListTableView *t_tableView = [[TrelloListTableView alloc]initWithFrame:CGRectMake(nextX, 0.0f, ScreenWidth - 60.0f, self.height) style:UITableViewStylePlain listItem:[self.listItems objectAtIndex:i]];
                t_tableView.delegate = self;
                t_tableView.dataSource = self;
                [self addSubview:t_tableView];
                
                nextX = t_tableView.right + 15.0f;
                [self.visibleTableViewArray addObject:t_tableView];
            }
            else
            {
                TrelloListTableView *t_tableView = (TrelloListTableView *)[self.visibleTableViewArray objectAtIndex:i];
                t_tableView.listItem = [self.listItems objectAtIndex:i];
                [t_tableView reloadData];
                nextX = t_tableView.right + 15.0f;
            }
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(TrelloListTableView *)tableView listItem].rowNumber;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TrelloListTableView *t_tableView = (TrelloListTableView *)tableView;
    if(!t_tableView.trelloListHeaderView)
    {
        UIView *t_view = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, t_tableView.width, 60.0f)];
        t_view.backgroundColor = SC_Global_trelloGray;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:t_view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = t_view.bounds;
        maskLayer.path = maskPath.CGPath;
        t_view.layer.mask = maskLayer;
        
        TrelloListIconView *menuIcon = [[TrelloListIconView alloc]initWithFrame:CGRectMake(20.0f, 20.0f, 5.0f, 30.0f)];
        [t_view addSubview:menuIcon];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50.0f, 20.0f, t_tableView.width - 60.0f, 20.0f)];
        titleLabel.textColor = SC_Global_trelloLightGray;
        titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        titleLabel.text = t_tableView.listItem.title;
        [t_view addSubview:titleLabel];
        
        UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0.0f, t_view.height - 1.0f, t_view.width, 1.0f)];
        bottomLine.backgroundColor = [UIColor lightGrayColor];
        [t_view addSubview:bottomLine];
        
        t_tableView.trelloListHeaderView = t_view;
    }
    return t_tableView.trelloListHeaderView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrelloListTableView *t_tableView = (TrelloListTableView *)tableView;
    
    TrelloListCellItem *t_item = [t_tableView.listItem.rowItemsArray objectAtIndex:indexPath.row];
    TrelloListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[TrelloListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.item = t_item;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrelloListTableView *t_tableView = (TrelloListTableView *)tableView;
    
    TrelloListCellItem *t_item = [t_tableView.listItem.rowItemsArray objectAtIndex:indexPath.row];
    if(t_item.image)
    {
        return 220.0f;
    }
    else
    {
        return 80.0f;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y > 0.0f)
    {
        if(!_isFoldMode)
        {
            if(self.HeaderDidFoldedCallBack)
            {
                self.HeaderDidFoldedCallBack();
            }
        }
    }
    else if(scrollView.contentOffset.y < 0.0f)
    {
        if(_isFoldMode)
        {
            if(self.HeaderDidFoldedCallBack)
            {
                self.HeaderDidFoldedCallBack();
            }
        }
    }
}
@end
