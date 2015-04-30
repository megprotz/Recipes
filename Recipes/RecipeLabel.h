//
//  RecipeLabel.h
//  Recipes
//
//  Created by mmp001 on 4/29/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeLabel : UILabel

- (void) boldSubstring: (NSString*) substring;
- (void) boldRange: (NSRange) range;

@end
