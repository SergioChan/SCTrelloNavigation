//
//  ViewController.m
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (nonatomic) BOOL isFoldedMode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Global_trelloDeepBlue;
//    self.isFoldedMode = NO;
    
    UIBarButtonItem *search = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search:)];
    search.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = search;
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *t_array = [NSMutableArray arrayWithObjects:@"fuck",@"fuck1",@"fuck2",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",@"fuck",nil];
    TrelloListItem *item_1 = [[TrelloListItem alloc]initWithTitle:@"BACKLOG" level:2 rowNumber:10 rowItems:t_array];
    TrelloListItem *item_2 = [[TrelloListItem alloc]initWithTitle:@"BRIEFS" level:5 rowNumber:7 rowItems:t_array];
    TrelloListItem *item_3 = [[TrelloListItem alloc]initWithTitle:@"DESIGN" level:3 rowNumber:5 rowItems:t_array];
    TrelloListItem *item_4 = [[TrelloListItem alloc]initWithTitle:@"USER TESTING" level:2 rowNumber:3 rowItems:t_array];
    TrelloListItem *item_5 = [[TrelloListItem alloc]initWithTitle:@"PRODUCT" level:4 rowNumber:12 rowItems:t_array];
    
    self.trelloView = [[TrelloView alloc]initWithFrame:CGRectMake(0.0f, 64.0f, ScreenWidth, ScreenHeight - 64.0f) listArray:@[item_1,item_2,item_3,item_4,item_5]];
    [self.view addSubview:_trelloView];
}

- (void)search:(id)sender
{
    //[_trelloView switchMode];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar lt_setBackgroundColor:Global_trelloBlue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
