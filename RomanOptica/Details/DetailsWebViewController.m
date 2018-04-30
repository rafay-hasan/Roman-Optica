//
//  DetailsWebViewController.m
//  RomanOptica
//
//  Created by Rafay Hasan on 4/29/18.
//  Copyright © 2018 Rafay Hasan. All rights reserved.
//

#import "DetailsWebViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import "SVProgressHUD.h"

@interface DetailsWebViewController ()<UIWebViewDelegate,LGSideMenuControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *detailsWebview;

- (IBAction)barButtonAction:(id)sender;

@end

@implementation DetailsWebViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWebview];
}
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.sideMenuController.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD show];
    self.view.userInteractionEnabled = NO;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
    self.view.userInteractionEnabled = YES;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD dismiss];
    self.view.userInteractionEnabled = YES;
}

-(void) loadWebview {
    self.title = self.itemname;
    NSString *urlString = self.itemUrlString;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.detailsWebview loadRequest:urlRequest];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)barButtonAction:(id)sender {
    [[self sideMenuController] showLeftViewAnimated:sender];
}

- (void)willShowLeftView:(nonnull UIView *)leftView sideMenuController:(nonnull LGSideMenuController *)sideMenuController {
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"leftMenuSelected"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didHideLeftView:(nonnull UIView *)leftView sideMenuController:(nonnull LGSideMenuController *)sideMenuController {
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"leftMenuSelected"]);
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"leftMenuSelected"] isKindOfClass:[NSString class]]) {
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"leftMenuSelected"] isEqualToString:@"Collection"]) {
            self.itemname = @"Collection";
            self.itemUrlString = @"http://romanoptica.info/app_collections/7";
            [self loadWebview];
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"leftMenuSelected"] isEqualToString:@"Gallery"]) {
            self.itemname = @"Gallery";
            self.itemUrlString = @"http://romanoptica.info/app_gallery/7";
            [self loadWebview];
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"leftMenuSelected"] isEqualToString:@"Profile"]) {
            self.itemname = @"Profile";
            self.itemUrlString = @"http://romanoptica.info/app_collections/7";
            [self loadWebview];
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"leftMenuSelected"] isEqualToString:@"Message"]) {
            self.itemname = @"Message";
            self.itemUrlString = @"http://romanoptica.info/app_message/7";
            [self loadWebview];
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"leftMenuSelected"] isEqualToString:@"Event"]) {
            self.itemname = @"Event";
            self.itemUrlString = @"http://romanoptica.info/app_events/7";
            [self loadWebview];
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"leftMenuSelected"] isEqualToString:@"Offer"]) {
            self.itemname = @"Offer";
            self.itemUrlString = @"http://romanoptica.info/app_offers/7";
            [self loadWebview];
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"leftMenuSelected"] isEqualToString:@"Contact"]) {
            self.itemname = @"Contact";
            self.itemUrlString = @"http://romanoptica.info/app_collections/7";
            [self loadWebview];
        }
    }
}
@end
