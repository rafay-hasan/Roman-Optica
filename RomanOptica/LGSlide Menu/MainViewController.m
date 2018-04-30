//
//  MainViewController.m
//  RomanOptica
//
//  Created by Rafay Hasan on 4/29/18.
//  Copyright © 2018 Rafay Hasan. All rights reserved.
//

#import "MainViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"navigationCntlr"];
   // MainViewController *mainViewController = [self.storyboard instantiateInitialViewController];
    self.rootViewController = navigationController;
    self.leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"left"];
    self.rightViewController = [RightViewController new];
    self.leftViewBackgroundColor = [UIColor whiteColor];
    self.rightViewBackgroundColor = [UIColor whiteColor];
    self.leftViewWidth = 250.0;
    self.rightViewWidth = 200.0;
    self.swipeGestureArea = LGSideMenuSwipeGestureAreaBorders;
    self.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    self.rightViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    window.rootViewController = self;
    
    [UIView transitionWithView:window
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:nil
                    completion:nil];
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

@end
