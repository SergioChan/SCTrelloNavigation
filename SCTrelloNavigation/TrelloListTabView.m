//
//  TrelloListTabView.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListTabView.h"

@implementation TrelloListTabView

- (id)initWithFrame:(CGRect)frame withListArray:(NSArray *)listItems
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.listItems = [listItems mutableCopy];
        self.listItemViews = [NSMutableArray array];
        self.selectedIndex = 0;
        self.isBriefMode = YES;
        self.isFoldedMode = NO;
        self.scrollEnabled = NO;
        self.contentSize = CGSizeMake(70.0f + listItems.count * 30.0f, self.height);
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    CGFloat nextX = 70.0f;
    for(TrelloListItem *t_item in self.listItems)
    {
        TrelloListItemView *view = [[TrelloListItemView alloc]initWithItem:t_item];
        CGRect frame = view.frame;
        frame.origin.x = nextX;
        view.frame = frame;
        nextX += view.width;
        [self addSubview:view];
        [self.listItemViews addObject:view];
    }
}

- (void)selectBoardAtIndex:(NSInteger)index
{
    [UIView animateWithDuration:0.2f animations:^{
        for(NSInteger i=0;i<self.listItemViews.count;i++)
        {
            TrelloListItemView *t_boardView = [self.listItemViews objectAtIndex:i];
            if(i == index)
            {
                [self scrollRectToVisible:t_boardView.frame animated:NO];
                
                // 注： tabView 会自动将未显示部分显示出来
                t_boardView.boardView.alpha = 1.0f;
            }
            else
            {
                t_boardView.boardView.alpha = 0.5f;
            }
        }
    } completion:^(BOOL finished) {
        if(finished)
        {
            self.selectedIndex = index;
        }
    }];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(touches.count == 1)
    {
        for(UITouch *touch in touches)
        {
            if(touch.phase == UITouchPhaseEnded || touch.phase == UITouchPhaseCancelled)
            {
                [super touchesMoved:touches withEvent:event];
                return;
            }
            else if(touch.phase == UITouchPhaseMoved)
            {
                CGPoint currentPoint = [touch locationInView:self];
                CGPoint prevPoint = [touch previousLocationInView:self];
                
                if(currentPoint.y - prevPoint.y > 2)
                {
                    if(self.isBriefMode)
                    {
                        if(self.HeaderDidSwitchCallBack)
                        {
                            self.HeaderDidSwitchCallBack();
                        }
                    }
                }
                else
                {
                    return;
                }
            }
        }
    }

}
@end
