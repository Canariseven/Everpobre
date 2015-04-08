//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Carmelo Ruymán Quintana Santana on 8/4/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)
-(UINavigationController *) wrappedInNavigation{
    UINavigationController * nav = [UINavigationController new];
    [nav pushViewController:self animated:NO];
    return nav;
}
@end
