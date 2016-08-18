//
//  TrelloListTableViewCell.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/6.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "TrelloListTableViewCell.h"

@implementation TrelloListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = SC_Global_trelloGray;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(10.0f, 5.0f, self.width - 20.0f, self.height - 5.0f)];
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.layer.masksToBounds = YES;
    _bgView.layer.cornerRadius = 5.0f;
    [self.contentView addSubview:_bgView];
    
    self.detailImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _detailImageView.contentMode = UIViewContentModeScaleAspectFill;
    _detailImageView.layer.masksToBounds = YES;
    [self.bgView addSubview:_detailImageView];
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _contentLabel.textColor = SC_Global_trelloLightGray;
    _contentLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.bgView addSubview:_contentLabel];
    
    self.colorIndicatorView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.bgView addSubview:_colorIndicatorView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bgView.frame = CGRectMake(10.0f, 5.0f, self.width - 20.0f, self.height - 5.0f);
    if(self.item.image)
    {
        self.detailImageView.frame = CGRectMake(0.0f, 0.0f, self.bgView.width, 160.0f);
        self.detailImageView.image = self.item.image;
        self.colorIndicatorView.frame = CGRectZero;
        self.contentLabel.frame = CGRectMake(15.0f, _detailImageView.bottom + 10.0f, self.bgView.width - 30.0f, 20.0f);
        self.contentLabel.text = self.item.content;
    }
    else
    {
        self.detailImageView.frame = CGRectZero;
        self.detailImageView.image = nil;
        self.colorIndicatorView.frame = CGRectMake(15.0f, 20.0f, 50.0f, 4.0f);
        switch (self.item.type) {
            case SCTrelloCellItemGreen:
                self.colorIndicatorView.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:100.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
                break;
            case SCTrelloCellItemYellow:
                self.colorIndicatorView.backgroundColor = [UIColor yellowColor];
                break;
            case SCTrelloCellItemOrange:
                self.colorIndicatorView.backgroundColor = [UIColor orangeColor];
                break;
            case SCTrelloCellItemRed:
                self.colorIndicatorView.backgroundColor = [UIColor redColor];
                break;
            default:
                self.colorIndicatorView.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:100.0f/255.0f blue:0.0f/255.0f alpha:1.0f];;
                break;
        }
        self.contentLabel.frame = CGRectMake(15.0f, self.colorIndicatorView.bottom + 10.0f, self.bgView.width - 30.0f, 20.0f);
        self.contentLabel.text = self.item.content;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
