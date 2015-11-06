//
//  TrelloListTableView.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/6.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListTableView.h"

@implementation TrelloListTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style listItem:(TrelloListItem *)item
{
    self = [super initWithFrame:frame style:style];
    if(self)
    {
        self.listItem = item;
        
        UIView *t_view = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.width, 30.0f)];
        t_view.backgroundColor = Global_trelloGray;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:t_view.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = t_view.bounds;
        maskLayer.path = maskPath.CGPath;
        t_view.layer.mask = maskLayer;
        
        [self setTableFooterView:t_view];
    }
    return self;
}
@end
