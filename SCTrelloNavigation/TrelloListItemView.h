//
//  TrelloListItemView.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrelloListItem.h"
#import "GlobalHeader.h"

@interface TrelloListItemView : UIView

@property (strong,nonatomic) UILabel *titlelabel;
@property (strong,nonatomic) UIView *boardView;
@property (strong,nonatomic) TrelloListItem *item;

- (id)initWithItem:(TrelloListItem *)item;
@end
