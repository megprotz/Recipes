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
#import "RecipeTableCell.h"

@interface RecipeTableViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end


@implementation RecipeTableViewController

NSArray *recipes;
NSMutableArray *recipeTitles;
NSMutableArray *recipeImages;

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
    
    if ([self.allSelectedIngredients count]>0) {
        //Perform Fetches
        NSError *error = nil;
        [self.fetchedResultsController performFetch:&error];
        
        if(error){
            NSLog(@"Unable to perform fetch.");
            NSLog(@"%@, %@", error, error.localizedDescription);
        }
        
        recipes = [self.fetchedResultsController fetchedObjects];
    }
    else{
        recipes = nil;
    }
        
    //Create two arrays of recipe names and images:
    recipeTitles = [[NSMutableArray alloc] init];
    recipeImages = [[NSMutableArray alloc] init];
    NSString *newRecipe;
    NSString *newRecipeImageString;
    UIImage *newRecipeImage = [[UIImage alloc] init];
    UIImage *none = [[UIImage alloc] init];
    none = [UIImage imageNamed:@"noImage.jpg"];
    for (NSManagedObject *managedObject in recipes) {
        newRecipe = [[managedObject valueForKey:@"title"] capitalizedString];
        [recipeTitles addObject:newRecipe];
        newRecipeImageString = [managedObject valueForKey:@"image"];
        if (newRecipeImageString != nil) {
            newRecipeImage = [UIImage imageNamed:newRecipeImageString];
            [recipeImages addObject:newRecipeImage];
        }
        else {
            [recipeImages addObject:none];
        }
    }
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
    if([recipes count] == 0)
        return 1;
    return [recipes count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([recipes count]==0){
        return self.view.frame.size.height;
    }
    return 110.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell"];
    
    if([recipes count]==0){
        //Create a cell with the no data image
        tableView.scrollEnabled=NO;
        cell.recipeName.text = @"Sorry...No Recipes Found.";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //////  TO DO: Make sure that nothing is selected (does not follow segue) in this case!!!!!! /////////////
    }
    else{
        //Create your default cell with data..
        tableView.scrollEnabled=YES;
        if (cell == nil) {
            cell = [[RecipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recipeCell"];
        }
        if ([recipes count]>0) {
            cell.recipeName.text = [recipeTitles objectAtIndex:indexPath.row];
            if ([recipeImages objectAtIndex:indexPath.row] != nil) {
                cell.recipeImage.image = [recipeImages objectAtIndex:indexPath.row];
            }
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TO DO: NEED TO IMPLEMENT THIS METHOD
}



@end
