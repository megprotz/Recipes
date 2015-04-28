//
//  IndividualRecipeViewController.m
//  Recipes
//
//  Created by mmp001 on 4/27/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "IndividualRecipeViewController.h"
#import "IndividualRecipeView.h"

@implementation IndividualRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IndividualRecipeView *recipeView = (IndividualRecipeView *)self.view;
    
    //Populate view labels and images with proper data passed from RecipeTableViewController:
    recipeView.recipeTitle.text = self.nameOfRecipe;
    recipeView.recipeTime.text = [NSString stringWithFormat: @"Total Time: %@ minutes", self.time.stringValue];
    recipeView.recipeInstructions.text = self.instructions;
    recipeView.recipeImage.contentMode = UIViewContentModeScaleAspectFit;
    recipeView.recipeImage.image = self.image;
    
    NSString *allIngredientsList = nil;
    for (NSString *ingredient in self.ingredients) {
        if (allIngredientsList == nil) {
            allIngredientsList = [NSString stringWithFormat:@"%@", [ingredient capitalizedString]];
        }
        else {
            allIngredientsList = [NSString stringWithFormat:@"%@, %@", allIngredientsList, [ingredient capitalizedString]];
        }
    }
    
    recipeView.recipeIngredients.text = [NSString stringWithFormat:@"Necessary Ingredients: %@", allIngredientsList];
}

@end
