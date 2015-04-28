//
//  RecipeScreen.h
//  Recipes
//
//  Created by mmp001 on 4/28/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndividualRecipeView : UIView

@property (weak, nonatomic) IBOutlet UILabel *recipeTitle;

@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;

@property (weak, nonatomic) IBOutlet UILabel *recipeTime;

@property (weak, nonatomic) IBOutlet UILabel *recipeIngredients;

@property (weak, nonatomic) IBOutlet UILabel *recipeInstructions;

@end
