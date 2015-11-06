//
//  TrelloListItem.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrelloListItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (nonatomic) NSInteger heightLevel;

@property (nonatomic) NSInteger rowNumber;
@property (strong, nonatomic) NSMutableArray *rowItemsArray;

- (id)initWithTitle:(NSString *)title level:(NSInteger)level rowNumber:(NSInteger)rowNumber rowItems:(NSMutableArray *)rowItems;
@end
