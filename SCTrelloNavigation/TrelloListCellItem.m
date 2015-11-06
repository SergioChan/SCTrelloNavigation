//
//  TrelloListCellItem.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/6.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListCellItem.h"

@implementation TrelloListCellItem

- (id)initWithContent:(NSString *)content image:(UIImage *)image type:(SCTrelloCellItemType)type
{
    self = [super init];
    if(self)
    {
        self.content = content;
        self.image = image;
        self.type = type;
    }
    return self;
}
@end
