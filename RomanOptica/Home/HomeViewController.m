//
//  HomeViewController.m
//  RomanOptica
//
//  Created by Rafay Hasan on 4/29/18.
//  Copyright © 2018 Rafay Hasan. All rights reserved.
//

#import "HomeViewController.h"
#import "ItemTableViewCell.h"
#import "DetailsWebViewController.h"
#import "HomeHeader.h"
#import "MXParallaxHeader.h"
#import "UIViewController+LGSideMenuController.h"

@interface HomeViewController ()
@property (strong,nonatomic) HomeHeader *myHeaderView;
@property (strong,nonatomic) NSArray *itemArray;
- (IBAction)menuButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *menuTableview;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemArray = [NSArray arrayWithObjects:@"Collection",@"Gallery",@"Profile",@"Message",@"Event",@"Offer",@"Contact", nil];
    self.myHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeader" owner:self options:nil] objectAtIndex:0];
    self.menuTableview.parallaxHeader.view = self.myHeaderView;
    self.menuTableview.parallaxHeader.height = 250;
    self.menuTableview.parallaxHeader.mode = MXParallaxHeaderModeFill;
    self.menuTableview.parallaxHeader.minimumHeight = 150;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.sideMenuController.leftViewSwipeGestureEnabled = NO;
    self.sideMenuController.rightViewSwipeGestureEnabled = NO;
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
    return self.itemArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    cell.itemNamelbl.text = [self.itemArray objectAtIndex:indexPath.section];
    cell.itemImageView.image = [UIImage imageNamed:[self.itemArray objectAtIndex:indexPath.section]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsWebViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    vc.itemname = [self.itemArray objectAtIndex:indexPath.section];
    switch (indexPath.section) {
        case 0:
            vc.itemUrlString = @"http://romanoptica.info/app_collections/7";
            break;
        case 1:
            vc.itemUrlString = @"http://romanoptica.info/app_gallery/7";
            break;
        case 2:
            vc.itemUrlString = @"http://romanoptica.info/app_collections/7";
            break;
        case 3:
            vc.itemUrlString = @"http://romanoptica.info/app_message/7";
            break;
        case 4:
            vc.itemUrlString = @"http://romanoptica.info/app_events/7";
            break;
        case 5:
            vc.itemUrlString = @"http://romanoptica.info/app_offers/7";
            break;
        default:
            vc.itemUrlString = @"http://romanoptica.info/app_collections/7";
            break;;
    }
    [self.navigationController pushViewController:vc animated:YES];
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

- (IBAction)menuButtonAction:(id)sender {
}
@end
