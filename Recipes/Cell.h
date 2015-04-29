//
//  Cell.h
//  Recipes
//
//  Created by mmp001 on 4/19/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *ingredientLabel;


@property (weak, nonatomic) IBOutlet UIButton *deleteButton;


@end
