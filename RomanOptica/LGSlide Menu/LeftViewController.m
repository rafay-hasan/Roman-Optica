//
//  LeftViewController.m
//  RomanOptica
//
//  Created by Rafay Hasan on 4/29/18.
//  Copyright © 2018 Rafay Hasan. All rights reserved.
//

#import "LeftViewController.h"
#import "ItemTableViewCell.h"
#import "UIViewController+LGSideMenuController.h"

@interface LeftViewController ()

@property (strong,nonatomic) NSArray *itemArray;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemArray = [NSArray arrayWithObjects:@"Collection",@"Gallery",@"Profile",@"Message",@"Event",@"Offer",@"Contact", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuItemCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.itemArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setObject:[self.itemArray objectAtIndex:indexPath.row]  forKey:@"leftMenuSelected"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[self sideMenuController] hideLeftViewAnimated:NULL];
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

@end
