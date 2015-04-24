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
#import "RecipeCell.h"

@interface RecipeTableViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end


@implementation RecipeTableViewController

NSArray *recipes;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    //Initialize Fetch Requests
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"FoodItem"];
    
    //Add Sort Descriptors
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    //Add Predicate
    NSMutableArray *predicateArray = [[NSMutableArray alloc] init];
    for (NSString *ingredient in self.allSelectedIngredients) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(ANY needs.name == %@)", [ingredient lowercaseString]];
        [predicateArray addObject:predicate];
    }
    NSPredicate *finalPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicateArray];
    [fetchRequest setPredicate:finalPredicate];
    
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
    recipes = [self.fetchedResultsController fetchedObjects];
}

/////The below methods are implementations of the Delegate Protocol methods. Not really sure if they are relevant to me, but they are from one of the tutorials. May need to implement later. //////
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.recipeTable beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.recipeTable endUpdates];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.recipeTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.recipeTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeUpdate: {
            // [self configureCell:(TSPToDoCell *)[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        }
        case NSFetchedResultsChangeMove: {
            [self.recipeTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.recipeTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell"];
    
    if (cell == nil) {
        cell = [[RecipeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recipeCell"];
    }
    
    cell.recipeName.text = [recipes objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TO DO: NEED TO IMPLEMENT THIS METHOD
}



@end
