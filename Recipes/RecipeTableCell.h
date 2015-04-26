//
//  RecipeCell.h
//  Recipes
//
//  Created by mmp001 on 4/23/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;

@property (weak, nonatomic) IBOutlet UILabel *recipeName;

@end
