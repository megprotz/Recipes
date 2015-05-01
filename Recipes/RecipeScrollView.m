//
//  RecipeScrollView.m
//  Recipes
//
//  Created by mmp001 on 4/30/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "RecipeScrollView.h"

@implementation RecipeScrollView

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
    // restrict movement to vertical only
    CGPoint newOffset = CGPointMake(0, contentOffset.y);
    [super setContentOffset:newOffset animated:animated];
}

- (void)setContentOffset:(CGPoint)contentOffset {
    // restrict movement to vertical only
    CGPoint newOffset = CGPointMake(0, contentOffset.y);
    [super setContentOffset:newOffset];
}

@end
