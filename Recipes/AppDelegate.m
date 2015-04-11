//
//  AppDelegate.m
//  Recipes
//
//  Created by mmp001 on 3/31/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)loadSampleData {
    //Below is code primarily from Bart Jacobs tutorial. Also adding basic/simple/trial info to Core Data
    //Probably should find a way to do this w/out so many lines of code.
    //Initialize Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Configure Window
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    //Create Food Objects
    NSEntityDescription *foodEntity = [NSEntityDescription entityForName:@"FoodItem" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *ccCookie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [ccCookie setValue:@"Chocolate Chip Cookies" forKey:@"title"];
    [ccCookie setValue:@30 forKey:@"cookTime"];
    [ccCookie setValue:@"Combine dry ingredients. Set aside. Combine butter, egg, sugar, vanilla. Add in flour mixture and chocolate chips. Bake at 325 for 7.5 min." forKey:@"instructions"];
    NSManagedObject *cCake = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cCake setValue:@"Chocolate Cake" forKey:@"title"];
    [cCake setValue:@60 forKey:@"cookTime"];
    [cCake setValue:@"Stir together sugar, flour, cocoa, baking powder, baking soda, and salt. Add eggs, milk, oil and vanilla. Stir in boiling water. Bake 30 to 35 min at 350." forKey:@"instructions"];
    NSManagedObject *vanillaCupcake = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [vanillaCupcake setValue:@"Vanilla Cupcake" forKey:@"title"];
    [vanillaCupcake setValue:@35 forKey:@"cookTime"];
    [vanillaCupcake setValue:@"Mix butter and sugar until light and fluffy. Stir in eggs one at a time. Stir in vanill and flour until just mixed. Bake at 350 18 to 20 min." forKey:@"instructions"];
    
    //Create Ingredient Objects
    NSEntityDescription *ingredientEntity = [NSEntityDescription entityForName:@"Ingredient" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *flour = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [flour setValue:@"flour" forKey:@"name"];
    [flour setValue:@"dry" forKey:@"category"];
    NSManagedObject *sugar = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [sugar setValue:@"sugar" forKey:@"name"];
    [sugar setValue:@"dry" forKey:@"category"];
    NSManagedObject *cocoa = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cocoa setValue:@"unsweetened cocoa powder" forKey:@"name"];
    [cocoa setValue:@"dry" forKey:@"category"];
    NSManagedObject *bakingPowder = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [bakingPowder setValue:@"baking powder" forKey:@"name"];
    [bakingPowder setValue:@"dry" forKey:@"category"];
    NSManagedObject *bakingSoda = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [bakingSoda setValue:@"baking soda" forKey:@"name"];
    [bakingSoda setValue:@"dry" forKey:@"category"];
    NSManagedObject *salt = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [salt setValue:@"salt" forKey:@"name"];
    [salt setValue:@"dry" forKey:@"category"];
    NSManagedObject *eggs = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [eggs setValue:@"eggs" forKey:@"name"];
    [eggs setValue:@"wet" forKey:@"category"];
    NSManagedObject *milk = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [milk setValue:@"milk" forKey:@"name"];
    [milk setValue:@"dairy" forKey:@"category"];
    NSManagedObject *vegetableOil = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [vegetableOil setValue:@"vegetable oil" forKey:@"name"];
    [vegetableOil setValue:@"wet" forKey:@"category"];
    NSManagedObject *vanilla = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [vanilla setValue:@"vanilla" forKey:@"name"];
    [vanilla setValue:@"wet" forKey:@"category"];
    NSManagedObject *water = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [water setValue:@"water" forKey:@"name"];
    [water setValue:@"wet" forKey:@"category"];
    NSManagedObject *cChips = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cChips setValue:@"chocolate chips" forKey:@"name"];
    [cChips setValue:@"dry" forKey:@"category"];
    NSManagedObject *butter = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [butter setValue:@"butter" forKey:@"name"];
    [butter setValue:@"dairy" forKey:@"category"];
    NSManagedObject *brownSugar = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [brownSugar setValue:@"brown sugar" forKey:@"name"];
    [brownSugar setValue:@"dry" forKey:@"category"];
    NSManagedObject *selfRisingFlour = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [selfRisingFlour setValue:@"self rising flour" forKey:@"name"];
    [selfRisingFlour setValue:@"dry" forKey:@"category"];
    NSManagedObject *cinnamon = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cinnamon setValue:@"cinnamon" forKey:@"name"];
    [cinnamon setValue:@"spice" forKey:@"category"];
    NSManagedObject *carraway = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [carraway setValue:@"carraway seeds" forKey:@"name"];
    [cinnamon setValue:@"spice" forKey:@"category"];
    NSManagedObject *buttermilk = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [buttermilk setValue:@"buttermilk" forKey:@"name"];
    [buttermilk setValue:@"dairy" forKey:@"category"];
    
    //Create Relationships
    [ccCookie setValue:[NSSet setWithObjects:cChips, salt, bakingSoda, flour, vanilla, eggs, brownSugar, sugar, butter, nil] forKey:@"needs"];
    
    [cCake setValue:[NSSet setWithObjects:water, vanilla, vegetableOil, milk, eggs, salt, bakingSoda, bakingPowder, cocoa, flour, sugar, nil] forKey:@"needs"];
    
    [vanillaCupcake setValue:[NSSet setWithObjects:vanilla, eggs, selfRisingFlour, sugar, butter, nil] forKey:@"needs"];
    
    
    //Save everything
    NSError *error = nil;
    if (![ccCookie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![cCake.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![vanillaCupcake.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![flour.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![sugar.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![cocoa.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![bakingPowder.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![bakingSoda.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![salt.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![eggs.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![milk.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![vegetableOil.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![vanilla.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![water.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![cChips.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![butter.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![brownSugar.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![selfRisingFlour.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![cinnamon.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![carraway.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![buttermilk.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"]) {}
    else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //This is the first launch ever.
        
        [self loadSampleData];
    }
    ///////////////////////////////////////////////////////////////////////////////////
    //Practice Fetching (to make sure it works) ***should remove this later***
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"FoodItem"];
    ////////SORT DESCRIPTOR. THERE CAN BE AN OPTION ON APP TO SORT BY.../////////
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(ANY needs.name == %@) AND (ANY needs.name == %@)", @"chocolate chips", @"flour"];
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    NSError *fetchError = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if(!fetchError){
        for (NSManagedObject *managedObject in result) {
            NSLog(@"%@", [managedObject valueForKey:@"title"]);
        }
    }
    else{
        NSLog(@"Error fetching data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    ///////////////////////////////////////////////////////////////////////////////////
    
    return YES;
}

-(NSInteger)calculateNumberOfRowsInIngredientTable:(NSString *)type{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Ingredient"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(ANY category == %@)",type];
    [fetchRequest setPredicate:predicate];
    NSError *fetchError = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    NSInteger count = 0;
    if(!fetchError){
        for (NSManagedObject *managedObject in result) {
            NSLog(@"%@", [managedObject valueForKey:@"title"]);  ///////////remove this line later-- here for testing purposes
            count++;
        }
        return count;
    }
    else{
        NSLog(@"Error fetching data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
        return 0;
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "sp.Recipes" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Recipes" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Recipes.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
