//
//  IndividualRecipeViewController.m
//  Recipes
//
//  Created by mmp001 on 4/27/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "IndividualRecipeViewController.h"
#import "IndividualRecipeView.h"
#import "RecipeLabel.h"

@implementation IndividualRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IndividualRecipeView *recipeView = (IndividualRecipeView *)self.view;
    
    //Populate view labels and images with proper data passed from RecipeTableViewController:
    recipeView.recipeTitle.text = self.nameOfRecipe;
    [recipeView.recipeTitle sizeToFit];
    
    recipeView.recipeTime.text = [NSString stringWithFormat: @"Total Time: %@ minutes", self.time.stringValue];
    [recipeView.recipeTime sizeToFit];
    RecipeLabel *recipeLabel = (RecipeLabel*)recipeView.recipeTime;
    //[recipeLabel boldSubstring:@"Total Time:"];
    
    recipeView.recipeInstructions.text = [NSString stringWithFormat:@"Directions: \n %@", self.instructions];
    [recipeView.recipeInstructions sizeToFit];
    
    recipeView.recipeImage.contentMode = UIViewContentModeScaleAspectFit;
    recipeView.recipeImage.image = self.image;
    
    NSString *allIngredientsList = nil;
    for (NSString *ingredient in self.ingredients) {
        if (allIngredientsList == nil) {
            allIngredientsList = [NSString stringWithFormat:@"%@", [ingredient capitalizedString]];
        }
        else {
            allIngredientsList = [NSString stringWithFormat:@"%@ \n %@", allIngredientsList, [ingredient capitalizedString]];
        }
    }
    
    recipeView.recipeIngredients.text = [NSString stringWithFormat:@"Necessary Ingredients:\n %@", allIngredientsList];
    [recipeView.recipeIngredients sizeToFit];
    
    //Set up visual aspects of cell:
    recipeView.recipeTime.layer.masksToBounds = NO;
    recipeView.recipeTime.layer.borderWidth=2.0f;
    recipeView.recipeTime.layer.borderColor = [UIColor colorWithRed:0.4 green:0.4 blue:1.0 alpha:0.5].CGColor;
    
    recipeView.recipeIngredients.layer.masksToBounds = NO;
    recipeView.recipeIngredients.layer.borderWidth=2.0f;
    recipeView.recipeIngredients.layer.borderColor = [UIColor colorWithRed:0.4 green:0.4 blue:1.0 alpha:0.5].CGColor;
    
    recipeView.recipeInstructions.layer.masksToBounds = NO;
    recipeView.recipeInstructions.layer.borderWidth=2.0f;
    recipeView.recipeInstructions.layer.borderColor = [UIColor colorWithRed:0.4 green:0.4 blue:1.0 alpha:0.5].CGColor;
}

@end
