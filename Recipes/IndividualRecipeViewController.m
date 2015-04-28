//
//  IndividualRecipeViewController.m
//  Recipes
//
//  Created by mmp001 on 4/27/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "IndividualRecipeViewController.h"

@implementation IndividualRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"tite: %@", self.title);
    NSLog(@"instructions: %@", self.instructions);
    NSLog(@"time: %@", self.time);
    for (NSString *string in self.ingredients) {
        NSLog(@"%@", string);
    }
    
}

@end
