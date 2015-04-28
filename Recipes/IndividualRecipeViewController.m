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
    recipeView.recipeTitle.text = self.title;
    recipeView.recipeTime.text = self.time.stringValue;
    recipeView.recipeInstructions.text = self.instructions;
    //recipeView.recipeImage = UIViewContentModeScaleAspectFit;
    recipeView.recipeImage.image = self.image;
}

@end
