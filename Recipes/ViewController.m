//
//  ViewController.m
//  Recipes
//
//  Created by mmp001 on 3/31/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Cell.h"
#import <UIKit/UIKit.h>
#import "RecipeTableViewController.h"

@interface ViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ViewController{
    Cell *sizingCell;
}

NSArray *result;
NSArray *ingredientResult;
NSMutableArray *allSelectedIngredients;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"MyCell"];
    
    
    // get a cell as template for sizing
    //_sizingCell = [[cellNib instantiateWithOwner:nil options:nil] objectAtIndex:0];
    
    //sizingCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:nil];
    
    //The following line makes sure that the ingredient table loads in the correct view location.
    self.categoryTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    allSelectedIngredients = temp;
    temp = nil;
    
    //Initialize Fetch Requests
    NSFetchRequest *categoryFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Ingredient"];
    
    //Add Sort Descriptors
    NSSortDescriptor *categorySortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"category" ascending:YES];
    [categoryFetchRequest setSortDescriptors:@[categorySortDescriptor]];

    //Initialize Fetched Results Controllers
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:categoryFetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    //Configure Fetched Results Controllers
    [self.fetchedResultsController setDelegate:self];
    
    //Perform Fetches
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    if(error){
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    result = [self.fetchedResultsController fetchedObjects];
}

//-(void)loadView{
//    [super loadView];
//}



/////The below methods are implementations of the Delegate Protocol methods. Not really sure if they are relevant to me, but they are from one of the tutorials. May need to implement later. //////
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.categoryTable beginUpdates];
    [self.ingredientTable beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.categoryTable endUpdates];
    [self.ingredientTable endUpdates];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.categoryTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.categoryTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeUpdate: {
           // [self configureCell:(TSPToDoCell *)[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        }
        case NSFetchedResultsChangeMove: {
            [self.categoryTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.categoryTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    if (tableView==self.categoryTable) {
        return [self calculateNumberRows:result withAttribute:@"category"];
    }
    else{ //tableView==self.ingredientTable
        
        return [self calculateNumberRows:ingredientResult withAttribute:@"name"];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.categoryTable) {
        
        static NSString *simpleTableIdentifier = @"SimpleTableItem";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        
        cell.textLabel.text = [[self calculateList:result forTable:@"category"] objectAtIndex:indexPath.row];
        
        return cell;
    }
    else{ //tableView==self.ingredientTable
       
        
        static NSString *simpleTableIdentifier = @"SimpleTableItem";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        
        cell.textLabel.text = [[self calculateList:ingredientResult forTable:@"name"] objectAtIndex:indexPath.row];
        
        if ([self isSelected:[[self calculateList:ingredientResult forTable:@"name"] objectAtIndex:indexPath.row]]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        return cell;

    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.categoryTable) {
        [self fetchToCreateIngredientTable:indexPath];
        [self.ingredientTable reloadData];
        [self.ingredientTable setHidden:NO];
    }
    else { //if tableView==self.ingredientTable
        NSString *ingredient = [self.ingredientTable cellForRowAtIndexPath:indexPath].textLabel.text;
        [self changeSelectedValue:ingredient];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [self.collectionView reloadData];
    }

}

-(NSArray *)calculateList:(NSArray *)result forTable:(NSString *)attribute{
    NSString *category = @"";
    NSString *newCategory;
    NSMutableArray *tableData = [[NSMutableArray alloc] init];
    for (NSManagedObject *managedObject in result) {
        newCategory = [[managedObject valueForKey:attribute] capitalizedString];
        if ([category isEqualToString:newCategory]) {
        }
        else{
            [tableData addObject:newCategory];
            category = newCategory;
        }
    }
    return tableData;
}

-(int)calculateNumberRows:(NSArray *)result withAttribute:(NSString *)attributeName{
    NSString *category = @"";
    NSString *newCategory;
    int count = 0;
    for (NSManagedObject *managedObject in result) {
        newCategory = [[managedObject valueForKey:attributeName] capitalizedString];
        if ([category isEqualToString:newCategory]) {
        }
        else{
            count++;
            category = newCategory;
        }
    }
    return count;
}

-(void)fetchToCreateIngredientTable:(NSIndexPath *)categoryRow{
    
    UITableViewCell *cell = [self.categoryTable cellForRowAtIndexPath:categoryRow];
    NSString *category = cell.textLabel.text;
    
    //Initialize Fetch Request
    NSFetchRequest *ingredientFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Ingredient"];

    //Add Sort Descriptor
    NSSortDescriptor *ingredientSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [ingredientFetchRequest setSortDescriptors:@[ingredientSortDescriptor]];

    //Add Predicate
    NSPredicate *ingredientPredicate = [NSPredicate predicateWithFormat:@"%K like[cd] %@", @"category", category];
    [ingredientFetchRequest setPredicate:ingredientPredicate];

    //Initialize Fetched Results Controller
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:ingredientFetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];

    //Set Delegate
    [self.fetchedResultsController setDelegate:self];

    //Perform Fetches
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];

    if(error){
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    ingredientResult = [self.fetchedResultsController fetchedObjects];
}

//The following method returns true if the passed ingredient is selected. Returns false otherwise.
-(BOOL)isSelected:(NSString *)ingredient{
    //Initialize Fetch Request
    NSFetchRequest *selectedFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Ingredient"];
    
    //Add Sort Descriptor
    NSSortDescriptor *selectedSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"selected" ascending:YES];
    [selectedFetchRequest setSortDescriptors:@[selectedSortDescriptor]];
    
    //Add Predicate
    NSPredicate *selectedPredicate = [NSPredicate predicateWithFormat:@"%K like[cd] %@", @"name", ingredient];
    [selectedFetchRequest setPredicate:selectedPredicate];
    
    //Initialize Fetched Results Controller
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:selectedFetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    //Set Delegate
    [self.fetchedResultsController setDelegate:self];
    
    //Perform Fetches
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    if(error){
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    NSArray *selectedIngredients = [self.fetchedResultsController fetchedObjects];
    
    NSManagedObject *managedObject = [selectedIngredients objectAtIndex:0];
   
    return [[managedObject valueForKey:@"selected"] boolValue];
}

//The following method changes the "selected" state of the passed ingredient. Also adds/removes the passed ingredient to NSMutableArray allSelectedIngredients, as necessary.
-(void)changeSelectedValue:(NSString *)ingredient{
    //Initialize Fetch Request
    NSFetchRequest *selectedFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Ingredient"];
    
    //Add Sort Descriptor
    NSSortDescriptor *selectedSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"selected" ascending:YES];
    [selectedFetchRequest setSortDescriptors:@[selectedSortDescriptor]];
    
    //Add Predicate
    NSPredicate *selectedPredicate = [NSPredicate predicateWithFormat:@"%K like[cd] %@", @"name", ingredient];
    [selectedFetchRequest setPredicate:selectedPredicate];
    
    //Initialize Fetched Results Controller
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:selectedFetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    //Set Delegate
    [self.fetchedResultsController setDelegate:self];
    
    //Perform Fetches
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    if(error){
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    NSArray *selectedIngredients = [self.fetchedResultsController fetchedObjects];
    
    NSManagedObject *managedObject = [selectedIngredients objectAtIndex:0];
    
    BOOL isSelected = ![[managedObject valueForKey:@"selected"] boolValue];
    [managedObject setValue:@(isSelected) forKey:@"selected"];
    if (isSelected) {
        [allSelectedIngredients addObject:ingredient];

    }
    else{
        [allSelectedIngredients removeObject:ingredient];
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return allSelectedIngredients.count/4+1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    if (section<allSelectedIngredients.count/4) {
        return 4;
    }
    return allSelectedIngredients.count%4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.ingredientLabel.text = [allSelectedIngredients objectAtIndex:indexPath.row+(indexPath.section*4)];
    [cell.deleteButton addTarget:self action:@selector(collectionViewCellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    //[self collectionView:collectionView layout:collectionView.self.collectionViewLayout sizeForItemAtIndexPath:indexPath];
    
    return cell;
}

- (IBAction)collectionViewCellButtonPressed:(UIButton *)button{
    
    //Access the cell
    Cell *cell = (Cell*)button.superview.superview;

    [self changeSelectedValue:cell.ingredientLabel.text];
    
    [self.collectionView reloadData];
    [self.ingredientTable reloadData];
}


//The following method is supposed to adjust the size of each cell based on the width of the text label.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ingredient = [allSelectedIngredients objectAtIndex:indexPath.row+(indexPath.section*4)];
  
    CGSize labelsize = [ingredient sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:17.0]}];
    
    labelsize = CGSizeMake(labelsize.width+60, labelsize.height+25);

    return labelsize;
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSError *error = nil;
    
    if (![self.managedObjectContext save:&error]) {
        if (error) {
            NSLog(@"Unable to save changes.");
            NSLog(@"%@, %@", error, error.localizedDescription);
        }
    }
}

//The following method sends the allSelectedIngredients array to the Recipe Table View Controller.
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"toRecipeList"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        RecipeTableViewController *controller = (RecipeTableViewController *)navController;
        controller.allSelectedIngredients = allSelectedIngredients;
    }
}




@end
