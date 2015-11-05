//
//  TrelloListItemView.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListItemView.h"

@implementation TrelloListItemView

- (id)initWithItem:(TrelloListItem *)item
{
    self = [super init];
    if(self)
    {
        self.frame = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f + item.heightLevel * 20.0f + 20.0f);
        self.item = item;
        
        self.titlelabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _titlelabel.textColor = [UIColor whiteColor];
        _titlelabel.font = [UIFont systemFontOfSize:10.0f];
        _titlelabel.text = item.title;
        _titlelabel.numberOfLines = 2;
        _titlelabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titlelabel];
        
        self.boardView = [[UIView alloc]initWithFrame:CGRectMake(5.0f, 5.0f, 20.0f, item.heightLevel * 10.0f)];
        _boardView.layer.masksToBounds = YES;
        _boardView.layer.cornerRadius = 5.0f;
        _boardView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
        _boardView.alpha = 0.5f;
        [self addSubview:_boardView];
    }
    return self;
}
@end
