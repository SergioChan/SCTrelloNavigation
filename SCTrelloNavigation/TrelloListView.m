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

        self.contentSize = CGSizeMake(listItems.count * ScreenWidth, self.height);
        self.contentOffset = CGPointMake(0.0f, 0.0f);
        
        self.pagingEnabled = YES;
        self.originTop = self.top;
        self.isFoldMode = NO;
        self.bouncesZoom = NO;
        self.bounces = YES;
        self.alwaysBounceVertical = NO;
        self.alwaysBounceHorizontal = NO;
        
        self.reusableTableViewArray = [NSMutableArray array];
        self.visibleTableViewArray = [NSMutableArray array];
        self.currentIndex = index;
        
        self.listItems = [listItems mutableCopy];
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(15.0f, 0.0f, ScreenWidth - 60.0f, self.height + 30.0f) style:UITableViewStylePlain];
        
        //注：这里高度加30是随便加的，高度会在往上滑动的过程中修复
        
        _tableView.tag = 10001;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = Global_trelloGray;
        _tableView.layer.cornerRadius = 5.0f;
        _tableView.layer.masksToBounds = YES;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        [self addSubview:_tableView];
        
        [self.visibleTableViewArray addObject:_tableView];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tableView.tag) {
        case 10001:
        {
            return 10;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (tableView.tag) {
        case 10001:
        {
            return 1;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (tableView.tag) {
        case 10001:
        {
            return 60.0f;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (tableView.tag) {
        case 10001:
        {
            TrelloListItem *t_item = [self.listItems objectAtIndex:self.currentIndex];
            return t_item.title;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (tableView.tag) {
        case 10001:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_1"];
            if(!cell)
            {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_1"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.textLabel.text = @"fuck";
            return cell;
        }
            break;
        default:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_default"];
            if(!cell)
            {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_default"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.textLabel.text = @"fuck";
            return cell;
        }
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (tableView.tag) {
        case 10001:
        {
            return 80.0f;
        }
            break;
        default:
        {
            return 0.0f;
        }
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y >= 80.0f)
    {
        if(!_isFoldMode)
        {
            _isFoldMode = YES;
            if(self.HeaderDidFoldedCallBack)
            {
                self.HeaderDidFoldedCallBack();
            }
        }
    }
    else
    {
        if(_isFoldMode)
        {
            _isFoldMode = NO;
            if(self.HeaderDidFoldedCallBack)
            {
                self.HeaderDidFoldedCallBack();
            }
        }
    }
}
@end
