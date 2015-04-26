//
//  RecipeTableViewController.h
//  Recipes
//
//  Created by mmp001 on 4/23/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeTableCell.h"

@interface RecipeTableViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property(nonatomic) NSArray *allSelectedIngredients;

@property (strong, nonatomic) IBOutlet UITableView *recipeTable;

@end
