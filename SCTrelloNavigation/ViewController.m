//
//  ViewController.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Global_trelloDeepBlue;

    
    UIBarButtonItem *search = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search:)];
    search.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = search;
    // Do any additional setup after loading the view, typically from a nib.
    
    TrelloListCellItem *cell_item_1_1 = [[TrelloListCellItem alloc] initWithContent:@"Login and Register function" image:nil type:SCTrelloCellItemGreen];
    TrelloListCellItem *cell_item_1_2 = [[TrelloListCellItem alloc] initWithContent:@"Upload and downLoad pictures" image:nil type:SCTrelloCellItemYellow];
    TrelloListCellItem *cell_item_1_3 = [[TrelloListCellItem alloc] initWithContent:@"Have a pleasant afternoon" image:[UIImage imageNamed:@"testImage3"] type:SCTrelloCellItemRed];
    
    TrelloListCellItem *cell_item_2_1 = [[TrelloListCellItem alloc] initWithContent:@"This is a Trello Navigation Demo" image:nil type:SCTrelloCellItemGreen];
    TrelloListCellItem *cell_item_2_2 = [[TrelloListCellItem alloc] initWithContent:@"Some of it have been organized" image:nil type:SCTrelloCellItemYellow];
    TrelloListCellItem *cell_item_2_3 = [[TrelloListCellItem alloc] initWithContent:@"Use it as a Library" image:nil type:SCTrelloCellItemRed];
    TrelloListCellItem *cell_item_2_4 = [[TrelloListCellItem alloc] initWithContent:@"Displayed content is random created" image:nil type:SCTrelloCellItemYellowAndOrange];
    
    TrelloListCellItem *cell_item_3_1 = [[TrelloListCellItem alloc] initWithContent:@"Make the interface more beautiful" image:nil type:SCTrelloCellItemGreen];
    TrelloListCellItem *cell_item_3_2 = [[TrelloListCellItem alloc] initWithContent:@"This feels awesome" image:[UIImage imageNamed:@"testImage2"] type:SCTrelloCellItemYellowAndOrange];
    
    TrelloListCellItem *cell_item_4_1 = [[TrelloListCellItem alloc] initWithContent:@"Test this first demo" image:nil type:SCTrelloCellItemGreen];
    TrelloListCellItem *cell_item_4_2 = [[TrelloListCellItem alloc] initWithContent:@"Push project to github" image:nil type:SCTrelloCellItemYellow];
    TrelloListCellItem *cell_item_4_3 = [[TrelloListCellItem alloc] initWithContent:@"Have a pleasant afternoon" image:[UIImage imageNamed:@"testImage1"] type:SCTrelloCellItemRed];
    
    NSMutableArray *t_array_1 = [NSMutableArray arrayWithObjects:cell_item_1_1,cell_item_1_2,cell_item_1_3, nil];
    NSMutableArray *t_array_2 = [NSMutableArray arrayWithObjects:cell_item_2_1,cell_item_2_2,cell_item_2_3,cell_item_2_4, nil];
    NSMutableArray *t_array_3 = [NSMutableArray arrayWithObjects:cell_item_3_1,cell_item_3_2, nil];
    NSMutableArray *t_array_4 = [NSMutableArray arrayWithObjects:cell_item_4_1,cell_item_4_2,cell_item_4_3, nil];
    
    TrelloListItem *item_1 = [[TrelloListItem alloc]initWithTitle:@"BACKLOG" level:3 rowNumber:3 rowItems:t_array_1];
    TrelloListItem *item_2 = [[TrelloListItem alloc]initWithTitle:@"BRIEFS" level:5 rowNumber:4 rowItems:t_array_2];
    TrelloListItem *item_3 = [[TrelloListItem alloc]initWithTitle:@"DESIGN" level:2 rowNumber:2 rowItems:t_array_3];
    TrelloListItem *item_4 = [[TrelloListItem alloc]initWithTitle:@"USER TESTING" level:4 rowNumber:3 rowItems:t_array_4];
    TrelloListItem *item_5 = [[TrelloListItem alloc]initWithTitle:@"PRODUCT" level:3 rowNumber:2 rowItems:t_array_3];
    
    // 初始化其实只要一句话的
    self.trelloView = [[TrelloView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, ScreenWidth, ScreenHeight) listArray:@[item_1,item_2,item_3,item_4,item_5]];
    [self.view addSubview:_trelloView];
}

- (void)search:(id)sender
{
    //[_trelloView switchMode];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.barTintColor = Global_trelloBlue;
    for (UIView *view in [[[self.navigationController.navigationBar subviews] objectAtIndex:0] subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.hidden = YES;
        }
    }
    //[self.navigationController.navigationBar lt_setBackgroundColor:Global_trelloBlue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
