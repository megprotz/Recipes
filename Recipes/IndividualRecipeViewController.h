//
//  IndividualRecipeViewController.h
//  Recipes
//
//  Created by mmp001 on 4/27/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndividualRecipeViewController : UIViewController

@property(nonatomic) NSString *title;
@property(nonatomic) NSNumber *time;
@property(nonatomic) NSArray *ingredients;
@property(nonatomic) NSString *instructions;
@property(nonatomic) UIImage *image;

@end
