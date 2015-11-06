//
//  TrelloListIconView.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/6.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListIconView.h"

@implementation TrelloListIconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIView *block_1 = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.width, self.width)];
        block_1.backgroundColor = Global_trelloLightGray;
        [self addSubview:block_1];
        
        UIView *block_2 = [[UIView alloc]initWithFrame:CGRectMake(0.0f, block_1.bottom + self.width/2.0f, self.width, self.width)];
        block_2.backgroundColor = Global_trelloLightGray;
        [self addSubview:block_2];
        
        UIView *block_3 = [[UIView alloc]initWithFrame:CGRectMake(0.0f, block_2.bottom + self.width/2.0f, self.width, self.width)];
        block_3.backgroundColor = Global_trelloLightGray;
        [self addSubview:block_3];
    }
    return self;
}

@end
