//
//  ViewController.h
//  Recipes
//
//  Created by mmp001 on 3/31/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *ingredientTable;

@property (weak, nonatomic) IBOutlet UITableView *categoryTable;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

