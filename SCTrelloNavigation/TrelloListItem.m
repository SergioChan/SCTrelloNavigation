//
//  TrelloListItem.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListItem.h"

@implementation TrelloListItem

- (id)initWithTitle:(NSString *)title level:(NSInteger)level rowNumber:(NSInteger)rowNumber rowItems:(NSMutableArray *)rowItems
{
    self = [super init];
    if(self)
    {
        self.title = title;
        self.heightLevel = level;
        self.rowNumber = rowNumber;
        self.rowItemsArray = rowItems;
    }
    return self;
}
@end
