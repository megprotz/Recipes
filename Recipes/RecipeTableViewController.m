//
//  RecipeTableViewController.m
//  Recipes
//
//  Created by mmp001 on 4/23/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "RecipeTableViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface RecipeTableViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end


@implementation RecipeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSString *string in self.allSelectedIngredients) {
        NSLog(@"%@", string);
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    //Initialize Fetch Requests
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"FoodItem"];
    
    //Add Sort Descriptors
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    //Add Predicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(ANY needs.name == %@) AND (ANY needs.name == %@)", @"chocolate chips", @"flour"];
    [fetchRequest setPredicate:predicate];
    
    //Initialize Fetched Results Controllers
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    //Configure Fetched Results Controllers
    [self.fetchedResultsController setDelegate:self];
    
    //Perform Fetches
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    if(error){
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    NSArray *result = [self.fetchedResultsController fetchedObjects];

    for (NSManagedObject *managedObject in result) {
        NSLog(@"%@", [managedObject valueForKey:@"title"]);
    }
}


@end
