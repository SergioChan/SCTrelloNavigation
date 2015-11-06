//
//  TrelloListCellItem.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/6.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SCTrelloCellItemType) {
    SCTrelloCellItemGreen = 0,
    SCTrelloCellItemOrange,
    SCTrelloCellItemRed,
    SCTrelloCellItemYellow,
    SCTrelloCellItemYellowAndOrange
};

@interface TrelloListCellItem : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *content;
@property (nonatomic) SCTrelloCellItemType type;

- (id)initWithContent:(NSString *)content image:(UIImage *)image type:(SCTrelloCellItemType)type;
@end
