//
//  RecipeTextView.h
//  Recipes
//
//  Created by mmp001 on 4/30/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeTextView : UITextView <NSLayoutManagerDelegate>

@property(nonatomic, assign) UIEdgeInsets textContainerInset;

@end
