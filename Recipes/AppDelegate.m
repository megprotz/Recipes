//
//  AppDelegate.m
//  Recipes
//
//  Created by mmp001 on 3/31/15.
//  Copyright (c) 2015 mmp001. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RecipeTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void) customizeAppearance{
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"SFCartoonistHand" size:20.0], NSFontAttributeName, nil]];
}

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
    [ccCookie setValue:@"chocolateChipCookies.jpg" forKey:@"image"];
    [ccCookie setValue:@"Preheat oven to 375 degrees Fahrenheit. \n\nCombine 2 1/4 c flour, 1 tsp baking soda, and 1 tsp salt in a small bowl. Beat 2 sticks butter, 3/4 c granulated sugar, and 1 tsp vanilla in a large mixer bowl until creamy. Add 2 eggs, one at a time, beating well after each addition. Gradually beat in flour mixture. Stir in 2 c chocolate chips. Drop by rounded tablespoon onto ungreased baking sheets. \n\n Bake for 9 to 11 minutes or until golden brown. Cool on baking sheets for 2 minutes; remove to wire racks to cool completely." forKey:@"instructions"];
   
    NSManagedObject *cCake = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cCake setValue:@"Chocolate Cake" forKey:@"title"];
    [cCake setValue:@105 forKey:@"cookTime"];
    [cCake setValue:@"chocolateCake.jpg" forKey:@"image"];
    [cCake setValue:@"Preheat the oven to 350 degrees Fahrenheit. Heavily grease and dust with cocoa four 9-inch round cake pans.\n\nIn a mixing bowl, combine 4 c flour, 4 c sugar, and 1/2 tsp salt.\n\nIn a saucepan, melt 4 sticks of butter. Add 8 heaping tbsp of cocoa powder. Stir together. Add 2 c boiling water, and allow the mixture to boil for 30 seconds and then turn off the heat. Pour over the flour mixture and stir lightly to cool. \n\nCombine 1 c buttermilk, 2tsp baking soda, 2 tsp vanilla, and 4 whole eggs (beaten). Stir the buttermilk mixture into the butter/chocolate mixture.\n\nDivide the batter among the prepared cake pans and bake for 20 minutes.\n\nCool completely before icing. Refrigerate the layers after baking for best results. Ice with chocolate icing." forKey:@"instructions"];
    
    NSManagedObject *chocolateIcing = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [chocolateIcing setValue:@"Chocolate Icing" forKey:@"title"];
    [chocolateIcing setValue:@120 forKey:@"cookTime"];
    [chocolateIcing setValue:@"chocolateIcing.jpg" forKey:@"image"];
    [chocolateIcing setValue:@"Heat 3 c heavy cream until very hot. Break 24 oz semisweet chocolate into pieces. Pour heated cream over the chocolate pieces. Stir to completely melt, and then pour into the bowl of an electric mixer. Refrigerate to cool.\n\nOnce completely cooled, add 2 tsp of vanilla, and beat with an electric mixer until light and airy." forKey:@"instructions"];
    
    NSManagedObject *vanillaCupcake = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [vanillaCupcake setValue:@"Vanilla Cupcake" forKey:@"title"];
    [vanillaCupcake setValue:@40 forKey:@"cookTime"];
    [vanillaCupcake setValue:@"vanillaCupcake.jpg" forKey:@"image"];
    [vanillaCupcake setValue:@"Preheat oven to 375 degrees Fahrenheit. Line muffin cups with papers.\n\nCream 1/2 c softened butter and 3/4 cup sugar until light and fluffy. Beat in 2 eggs, one at a time. \n\nMix together 2 c flour, 1/2 tsp salt, and 2 tsp baking powder. Add flour mixture to butter/sugar mixture. Add 1 c milk and beat well. Stir in 1 tsp vanilla.\n\nDivide batter evenly among pans and bake for 18 minutes. Let cool in pans." forKey:@"instructions"];
    
    NSManagedObject *cheesecakeBrownie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cheesecakeBrownie setValue:@"Cheesecake Brownie" forKey:@"title"];
    [cheesecakeBrownie setValue:@55 forKey:@"cookTime"];
    [cheesecakeBrownie setValue:@"cheesecakeBrownie.jpg" forKey:@"image"];
    [cheesecakeBrownie setValue:@"Preheat oven to 350 degrees Fahrenheit. Grease a 9-inch square baking pan.\n\nCombine 1 8 oz package of cream cheese with 1/4 c of sugar and 1 egg in a mixing bowl; beat until smooth. Stir 1 c chocolate chips into the cream cheese mixture. Set aside.\n\nFill a saucepan with water and bring to a boil. Turn the heat off, and set a heatproof mixing bowl over the water. In the mixing bowl, combine 1/4 c butter with 1 c chocolate chips; stir until just melted and blended together. Stir in 1/2 c sugar and 2 eggs, then sift together 2/3 c flour, 1/2 tsp baking powder, and 1/4 tsp salt. Stir into chocolate until evenly blended.\n\nPour half of the batter into the prepared baking pan. Spread the cream cheese mixture over the chocolate layer. Top with remaining chocolate mixture. Using a knife, swirl the top chocolate layer into the cream cheese to make a marble pattern.\n\nBake in preheated oven for 25 to 30 minutes, or until top is crinkled and edges pull away from sides of the pan. Cool thoroughly. But into 12 to 16 squares. Store in the refrigerator of freeze." forKey:@"instructions"];
    
    NSManagedObject *popTart = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [popTart setValue:@"Pop Tart" forKey:@"title"];
    [popTart setValue:@50 forKey:@"cookTime"];
    [popTart setValue:@"popTarts.jpg" forKey:@"image"];
    [popTart setValue:@"Preheat oven to 425 degrees Fahrenheit. Line baking sheets with parchment paper.\n\nUnroll 2 (15 oz) refrigerated pie crusts. Place pie crusts on a lightly floured work surface, and roll the crusts slightly with a rolling pin to square the edges. Cut each crust into 8 equal-sized rectangles. Place about 2 tsp of strawberry jam in the center of 8 squares, and spread the jam out to within 1/4 inch of the edge of the pastry square. Top each with another pastry square, and use a fork to crimp the squares together, sealing in the jam. Use a knife to trim the pastries, if desired. Move the filled pastries to the prepared baking sheets.\n\nBake in the preheated oven until the edges are lightly golden brown, about 7 minutes. Allow to cool on the baking sheets. Meanwhile, stir together 2 c confectioners' sugar, 2 tbsp milk, and 1/2 tsp vanilla extract in a bowl to make a spreadable frosting. Spread the cooled tarts with frosting and sprinkle with colored sprinkles." forKey:@"instructions"];
    
    NSManagedObject *caramelApplePie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [caramelApplePie setValue:@"Caramel Apple Pie" forKey:@"title"];
    [caramelApplePie setValue:@60 forKey:@"cookTime"];
    [caramelApplePie setValue:@"caramelApplePie.jpg" forKey:@"image"];
    [caramelApplePie setValue:@"Preheat oven to 375 degrees Fahrenheit. Mix 2 tbsp flour with 1/3 c packed brown sugar. Core and slice 5 large tart apples. Toss apples together with sugar/flour mixture. \n\nSprinkle one tbsp flour on a 9-inch unbaked pie crust, roll lightly to fit a 9 or 10 inch pie pan. Arrange apples in the bottom crust, and spread 1 c caramel dip over apples. Roll out another 9-inch pie crust with 1 tbsp flour. Lay over apples. Tuck over bottom crust and pinch edges together. Cut a few steam holes in top of pie.\n\nBake for 40 to 45 minutes or until golden brown. Let cool before serving." forKey:@"instructions"];
    
    NSManagedObject *blueberryPie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [blueberryPie setValue:@"Bluebery Pie" forKey:@"title"];
    [blueberryPie setValue:@120 forKey:@"cookTime"];
    [blueberryPie setValue:@"blueberryPie.jpg" forKey:@"image"];
    [blueberryPie setValue:@"Preheat oven to 375 degrees Fahrenheit. Press 1 9-inch pie crust into the bottom and sides of a 9-inch pie pan.\n\nStir 5 c fresh blueberries, 1/2 c sugar, 1/4 c flour, and 1/2 tsp cinnamon together in a large bowl. Add 1/4 tsp almond extract; stir to coat. Pour blueberry mixture into the prepared pie crust. Dot the blueberry mixture with butter pieces (1/4 cup pieces altogether). Top with another 9-inch pie crust, crimping the two crusts together. Brush top crust with 1 tbsp milk. Make a few incisions with a knife into the top crust to allow steam to escape during baking. Wrap the edges of the pie with aluminum foil to avoid burning.\n\nBake in the preheated oven for 25 minutes. Remove foil, and continue baking until blueberry filling is bubbling and crust is browned, 20 to 25 more minutes. Cool before serving." forKey:@"instructions"];
    
    NSManagedObject *strawberryPie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [strawberryPie setValue:@"Strawberry Pie" forKey:@"title"];
    [strawberryPie setValue:@10 forKey:@"cookTime"];
    [strawberryPie setValue:@"strawberryPie.jpg" forKey:@"image"];
    [strawberryPie setValue:@"In a medium bowl mix together 10 oz strawberries and 1 (8 oz) jar of ready-to-use strawberry glaze. Pour into 1 9-inch pie shell. Top with 1 (8 oz) container frozen whipped topping (thawed)." forKey:@"instructions"];
    
    NSManagedObject *pumpkinPie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [pumpkinPie setValue:@"Pumpkin Pie" forKey:@"title"];
    [pumpkinPie setValue:@60 forKey:@"cookTime"];
    [pumpkinPie setValue:@"pumpkinPie.jpg" forKey:@"image"];
    [pumpkinPie setValue:@"Preheat oven to 425 degrees Fahrenheit. \n\nCombine 2 eggs, 1 (16oz) can pumpkin puree, 1 (14 oz) can sweetened condensed milk, and 1 tsp pumpkin pie spice in a large bown and mix until combined.\n\nFit 1 9-inch pie crust into a 9-inch pie dish; pur pumpkin mixture into the crust.\n\nPlace pie on a baking sheet and bake in the preheated oven for 15 minutes. Reduce heat to 350 degrees Fahrenheit and bake until filling is set, 35 to 40 minutes." forKey:@"instructions"];
    
    NSManagedObject *peachBlueberryPie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [peachBlueberryPie setValue:@"Peach Blueberry Pie" forKey:@"title"];
    [peachBlueberryPie setValue:@60 forKey:@"cookTime"];
    [peachBlueberryPie setValue:@"peachBlueberryPie.jpg" forKey:@"image"];
    [peachBlueberryPie setValue:@"Preheat oven to 425 degrees Fahrenheit. Place one 9-inch pie crust into a pie plate.\n\nToss 3 c sliced peaches and 1 c blueberries in a bowl with 2 tbsp fresh lemon juice. Mix 1 c sugar, 2 tbsp quick-cooking tapioca, and 1/2 tsp salt in a small bowl and add to peach mixture; stir to combine. Allow fruit to rest for 15 minutes, then transfer to prepared pie plate. Scatter margarine pieces (2 tbsp total) over fruit and brush the edge of the pie with water. Cover pie with another 9-inch crust; press and seal the top and bottom crusts.\n\nBake in preheated oven until crust is golden brown and fruit is bubbly, about 45 to 50 minutes." forKey:@"instructions"];
    
    NSManagedObject *lemonCookies = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [lemonCookies setValue:@"Lemon Cookies" forKey:@"title"];
    [lemonCookies setValue:@60 forKey:@"cookTime"];
    [lemonCookies setValue:@"lemonCookie.jpg" forKey:@"image"];
    [lemonCookies setValue:@"Preheat oven to 375 degrees Fahrenheit. \n\nPour one (18.25 oz) package of lemon cake mix into a large bowl. Stir in 2 eggs, 1/3 c vegetable oil, and 1 tsp lemon extract until well blended. Drop teaspoonfuls of dough into a bowl of 1/3 c confectioners' sugar. Roll them around until they're lightly covered. Once sugared, put them on an ungreased cookie sheet.\n\nBake for 6 to 9 minutes in the preheated oven. The bottoms will be light brown, and the insides chewy." forKey:@"instructions"];
    
    NSManagedObject *peanutButterCookies = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [peanutButterCookies setValue:@"Peanut Butter Cookies" forKey:@"title"];
    [peanutButterCookies setValue:@45 forKey:@"cookTime"];
    [peanutButterCookies setValue:@"peanutButterCookie.jpg" forKey:@"image"];
    [peanutButterCookies setValue:@"Preheat oven to 350 degrees Fahrenheit. Grease cookie sheets.\n\nIn a medium bowl, stir 2 c peanut butter and 2 c sugar together until smooth. Beat in 2 eggs, one at a time, then stir in 2 tsp baking soda, a pinch of salt, and 1 tsp vanilla. Roll dough into 1 inch balls and place them 2 inches apart onto the prepared cookie sheets. Press a criss-cross into the top using the back of a fork.\n\nBake for 8 to 10 minutes in the preheated oven. Allow cookies to cool on baking sheet for 5 minutes before removing to a wire rack to cool completely." forKey:@"instructions"];
    
    NSManagedObject *peanutButterBananaCreamPie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [peanutButterBananaCreamPie setValue:@"Peanut Butter-Chocolate Banana Cream Pie" forKey:@"title"];
    [peanutButterBananaCreamPie setValue:@225 forKey:@"cookTime"];
    [peanutButterBananaCreamPie setValue:@"peanutButterBananaCreamPie.jpg" forKey:@"image"];
    [peanutButterBananaCreamPie setValue:@"Preheat oven to 350 degrees Fahrenheit.\n\nMix 35 finely crushed vanilla wafer crumbs and 1/4 c butter until blended; press onto bottom and up side of 9-inch pie plate. Bake 5 to 8 min. or until golden brown. Cool completely. Meanwhile, make chocolate curls from 1/2 oz. semisweet chocolate. Refrigerate.\n\nMicrowave 1.5 oz. chocolate and 1/2 c creamy peanut butter in microwaveable bowl on HIGH 1 min.; stir until chocolate is completely melted and mixture is well blended. Place 2 bananas (cut lengthwise in half, then crosswise into quarters) in crust; drizzle with melted chocolate.\n\nBeat 2 packages (3.4 oz each) of Vanilla pudding mixes and 2 c cold milk in large bowl with whisk for 2 min. Stir in 1 cup COOL WHIP. Spread over bananas; top with 1 c COOL WHIP.\n\nRefrigerate for 3 hours. Top with chocolate curls and 2 tbsp coarsely chopped peanuts just before serving." forKey:@"instructions"];
    
    NSManagedObject *layeredCoconutChocolateBars = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [layeredCoconutChocolateBars setValue:@"Layered Coconut-Chocolate Bars" forKey:@"title"];
    [layeredCoconutChocolateBars setValue:@155 forKey:@"cookTime"];
    [layeredCoconutChocolateBars setValue:@"coconutChocolateBar.jpg" forKey:@"image"];
    [layeredCoconutChocolateBars setValue:@"Line 13x9-inch pan with foil, with ends of foil extending over sides; spray with cooking spray. Microwave 5 oz. semisweet chocolate and 1/2 c butter in medium microwaveable bowl on HIGH 2 min. or until butter is melted; stir until chocolate is completely melted and mixture is well blended. Stir in 1 1/2 c graham cracker crumbs, 2/3 c finely chopped, toasted walnuts and 1 c coconut; press onto bottom of prepared pan. Refrigerate 15 min.\n\nBeat 1 package (8 oz) cream cheese with mixer until creamy. Gradually add 1/2 c cold milk, beating well after each addition. Add 1 package (3.4 oz) dry vanilla pudding mix; beat 2 min. (Mixture will be stiff.) Stir in 1 c coconut; spread over chocolate layer in pan.\n\nMicrowave 1/4 c butter and 3 oz semisweet chocolate in microwaveable bowl 1 min. or until butter is melted; stir until chocolate is completely melted and mixture is well blended. Pour over pudding layer; tilt pan to evenly cover pudding layer. Sprinkle with 1 1/3 c coconut. Refrigerate 2 hours or until firm. Use foil handles to lift dessert from pan before cutting into bars." forKey:@"instructions"];
    
    NSManagedObject *strawberrySwirlCake = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [strawberrySwirlCake setValue:@"Strawberry Swirl Cake" forKey:@"title"];
    [strawberrySwirlCake setValue:@105 forKey:@"cookTime"];
    [strawberrySwirlCake setValue:@"strawberrySwirlCake.jpg" forKey:@"image"];
    [strawberrySwirlCake setValue:@"Heat oven to 350°F.\n\nGrease and flour 2 (8- or 9-inch) round pans. Prepare 1 package white cake batter as directed on package; pour half into medium bowl. Add 1 package (3 oz) dry strawberry gelatin mix; stir until blended. Spoon half the white batter and half the pink batter, side by side, into each prepared pan; swirl gently with spoon.\n\nBake 30 min. Cool cakes 30 min. in pans. Remove to wire racks; cool completely.\n\nMix 2/3 c sour cream and 2/3 c powdered sugar in medium bowl until blended. Gently stir in 1 tub (8 oz) COOL WHIP. Stack cake layers on plate, filling with 1 cup of the COOL WHIP mixture and 1 cup strawberries. Frost top and side with remaining COOL WHIP mixture. Top with 1/2 c strawberries." forKey:@"instructions"];
    
    NSManagedObject *strawberryPretzelSquares = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [strawberryPretzelSquares setValue:@"Strawberry Pretzel Squares" forKey:@"title"];
    [strawberryPretzelSquares setValue:@300 forKey:@"cookTime"];
    [strawberryPretzelSquares setValue:@"strawberryPretzelSquares.jpg" forKey:@"image"];
    [strawberryPretzelSquares setValue:@"Mix 2 c finely crushed pretzel crumbs, 1/4 c sugar and 2/3 c butter; press onto bottom of 13x9-inch pan. Bake 10 min. Cool.\n\nBeat 1 1/2 package (12 oz total) cream cheese, 1/4 c sugar and 2 tbsp milk with mixer until blended. Stir in 1 c thawed COOL WHIP; spread over crust. Refrigerate until ready to use.\n\nAdd 2 c boiling water to 1 package (6 oz) gelatin mix in large bowl; stir 2 min. until completely dissolved. Stir in 1 1/2 c cold water. Refrigerate 1-1/2 hours or until thickened. Stir in 4 c fresh, sliced strawberries; spoon over cream cheese layer.\n\nRefrigerate 3 hours or until firm." forKey:@"instructions"];
    
    NSManagedObject *peachShortcake = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [peachShortcake setValue:@"Peach Shortcake" forKey:@"title"];
    [peachShortcake setValue:@30 forKey:@"cookTime"];
    [peachShortcake setValue:@"peachShortcake.jpg" forKey:@"image"];
    [peachShortcake setValue:@"Mix 1 c flour, 2 Tbsp. sugar, 2 tsp baking powder and 1/2 tsp lemon zest in large bowl. Cut in 4 oz (1/2 package) cream cheese with 2 knives or pastry blender until mixture resembles coarse crumbs. Stir in 1/3 cup milk until mixture forms dough. \n\nUse floured hands to divide dough into 8 pieces; shape each into ball. Place, 3 inches apart, on baking sheet sprayed with cooking spray; flatten to 1/2-inch thickness. Brush tops lightly with 1 tbsp milk; sprinkle with 2 tsp. of sugar.\n\nBake 12 to 15 min. or until golden brown. Meanwhile, combine 3 large fresh peaches, sliced, 2 tbsp sugar and 1 1/2 tbsp lemon juice. \n\nCool shortcakes slightly; split in half. Fill with peach mixture and COOL WHIP just before serving." forKey:@"instructions"];
    
    NSManagedObject *cremeDeMentheBrownies = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cremeDeMentheBrownies setValue:@"Creme de Menthe Brownies" forKey:@"title"];
    [cremeDeMentheBrownies setValue:@40 forKey:@"cookTime"];
    [cremeDeMentheBrownies setValue:@"cremeDeMentheBrownies.jpg" forKey:@"image"];
    [cremeDeMentheBrownies setValue:@"Preheat oven to 350 degree Fahrenheit. Grease a 9x9x2-inch baking pan and set aside. In a medium saucepan melt 1/2 c butter and 2 oz unsweetened chocolate over low heat. Stir in 1 c sugar, 2 eggs, and 1/4 tsp mint extract. Using a wooden spoon, beat lightly by hand just until combined. Stir in 2/3 c flour. Spread batter in prepared pan.\n\nBake for 20 minutes. Cool on a wire rack. Meanwhile for frosting, in a medium mixing bowl beat 1/4 cup butter or margarine until fluffy. Gradually add 1 cup sifted powdered sugar. Beat in 2 tbsp creme de menthe. Gradually beat in about 1/2 cup sifted powdered sugar until the frosting is easy to spread. Spread atop brownies. In a small, heavy saucepan melt 1 oz semisweet chocolate over low heat. Drizzle atop brownies. Let chocolate set, then cut into bars." forKey:@"instructions"];
    
    NSManagedObject *grasshopperMallowPie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [grasshopperMallowPie setValue:@"Grasshopper Mallow Pie" forKey:@"title"];
    [grasshopperMallowPie setValue:@250 forKey:@"cookTime"];
    [grasshopperMallowPie setValue:@"grasshopperMallowPie.jpg" forKey:@"image"];
    [grasshopperMallowPie setValue:@"Add 1/4 c green creme de menthe gradually to 1 jar (7 oz) marshmallow creme in large bowl, beating with electric mixer on medium speed until well blended. Gently stir in 2 c whipped cream.\n\nPour into 1 6 oz oreo pie crust.\n\nRefrigerate 4 to 6 hours or until chilled. Store leftover pie in refrigerator." forKey:@"instructions"];
    
    NSManagedObject *bananaMallowPie = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [bananaMallowPie setValue:@"Banana Mallow Pie" forKey:@"title"];
    [bananaMallowPie setValue:@75 forKey:@"cookTime"];
    [bananaMallowPie setValue:@"bananaMallowPie.jpg" forKey:@"image"];
    [bananaMallowPie setValue:@"Beat 1 package (3.4 oz) vanilla pudding mix and 1 3/4 c cold milk in large bowl with whisk 2 min. Let stand 5 min. Stir in 2 c mini marshmallows and 1 c thawed COOL WHIP.\n\nPlace 2 bananas, sliced, in 1 ready to use 6 oz graham cracker pie crust; cover with pudding mixture.\n\nRegrigerate 1 hour or until firm." forKey:@"instructions"];
    
    NSManagedObject *stripedDelight = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [stripedDelight setValue:@"Striped Delight" forKey:@"title"];
    [stripedDelight setValue:@280 forKey:@"cookTime"];
    [stripedDelight setValue:@"stripedDelight.jpg" forKey:@"image"];
    [stripedDelight setValue:@"Crush 35 oreo cookies until fine crumbs form. Transfer to medium bowl; mix in 6 tbsp melted butter. Press onto bottom of 13x9-inch dish. Refrigerate until ready to use.\n\nWhisk 1 package (8 oz) cream cheese, 1/4 c sugar and 2 Tbsp. milk in medium bowl until blended. Stir in 1-1/4 cups COOL WHIP; spread over crust.\n\nBeat 2 packages (3.9 oz each) chocolate pudding mixes and 3-1/4 cups milk with whisk 2 min.; pour over cream cheese layer. Let stand 5 min. or until thickened; cover with 1/4 c COOL WHIP. Refrigerate 4 hours." forKey:@"instructions"];
    
    NSManagedObject *vanillaSnickerdoodles = [[NSManagedObject alloc] initWithEntity:foodEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [vanillaSnickerdoodles setValue:@"Vanilla Snickerdoodles" forKey:@"title"];
    [vanillaSnickerdoodles setValue:@32 forKey:@"cookTime"];
    [vanillaSnickerdoodles setValue:@"vanillaSnickerdoodles.jpg" forKey:@"image"];
    [vanillaSnickerdoodles setValue:@"Heat oven to 350°F.\n\nCombine 2 1/4 c flour, 1 tsp baking soda and 1/2 tsp salt. Beat 1 c softened butter, 3/4 c packed brown sugar and 1/4 cup granulated sugar in large bowl with mixer until blended. Add 1 package (3.4 oz) dry vanilla pudding mix, 2 eggs and 1 tsp vanilla; mix well. Gradually beat in flour mixture until blended.\n\nMix 1/4 c granulated sugar and 2 tsp ground cinnamon in small bowl. Shape tablespoonfuls of dough into 40 balls; roll, in batches, in cinnamon sugar until evenly coated. Place, 2 inches apart, on baking sheets sprayed with cooking spray.\n\nBake 8 to 10 min. or until lightly browned. Cool on baking sheets 3 min. Remove to wire racks; cool completely." forKey:@"instructions"];
    
    /*
    //Create Measurement Objects
    NSEntityDescription *measurementEntity = [NSEntityDescription entityForName:@"Measurement" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *oneCup = [[NSManagedObject alloc] initWithEntity:measurementEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [oneCup setValue:@"1 c" forKey:@"amount"];
    NSManagedObject *threeQuarterCup = [[NSManagedObject alloc] initWithEntity:measurementEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [threeQuarterCup setValue:@"3/4 c" forKey:@"amount"];
    NSManagedObject *oneTsp = [[NSManagedObject alloc] initWithEntity:measurementEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [oneTsp setValue:@"1 tsp" forKey:@"amount"];
    NSManagedObject *twoAndOneQuarter = [[NSManagedObject alloc] initWithEntity:measurementEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [twoAndOneQuarter setValue:@"2 1/4 c" forKey:@"amount"];
    NSManagedObject *two = [[NSManagedObject alloc] initWithEntity:measurementEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [two setValue:@"2" forKey:@"amount"];
    NSManagedObject *twoCup = [[NSManagedObject alloc] initWithEntity:measurementEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [twoCup setValue:@"2 c" forKey:@"amount"];
     */
    
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
    [cocoa setValue:@"chocolate" forKey:@"category"];
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
    [cChips setValue:@"chocolate" forKey:@"category"];
    NSManagedObject *butter = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [butter setValue:@"butter or margarine" forKey:@"name"];
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
    [carraway setValue:@"spice" forKey:@"category"];
    NSManagedObject *buttermilk = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [buttermilk setValue:@"buttermilk" forKey:@"name"];
    [buttermilk setValue:@"dairy" forKey:@"category"];
    NSManagedObject *heavyCream = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [heavyCream setValue:@"heavy cream" forKey:@"name"];
    [heavyCream setValue:@"dairy" forKey:@"category"];
    NSManagedObject *semisweetChocolate = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [semisweetChocolate setValue:@"semisweet chocolate" forKey:@"name"];
    [semisweetChocolate setValue:@"chocolate" forKey:@"category"];
    NSManagedObject *creamCheese = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [creamCheese setValue:@"cream cheese" forKey:@"name"];
    [creamCheese setValue:@"dairy" forKey:@"category"];
    NSManagedObject *pieCrust = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [pieCrust setValue:@"pie crust" forKey:@"name"];
    [pieCrust setValue:@"other" forKey:@"category"];
    NSManagedObject *strawberryJam = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [strawberryJam setValue:@"strawberry jam" forKey:@"name"];
    [strawberryJam setValue:@"fruit" forKey:@"category"];
    NSManagedObject *powderedSugar = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [powderedSugar setValue:@"Powdered (Confectioner's) Sugar" forKey:@"name"];
    [powderedSugar setValue:@"dry" forKey:@"category"];
    NSManagedObject *sprinkles = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [sprinkles setValue:@"sprinkles" forKey:@"name"];
    [sprinkles setValue:@"toppings" forKey:@"category"];
    NSManagedObject *apples = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [apples setValue:@"apples" forKey:@"name"];
    [apples setValue:@"fruit" forKey:@"category"];
    NSManagedObject *caramelDip = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [caramelDip setValue:@"caramel dip" forKey:@"name"];
    [caramelDip setValue:@"other" forKey:@"category"];
    NSManagedObject *blueberries = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [blueberries setValue:@"blueberries" forKey:@"name"];
    [blueberries setValue:@"fruit" forKey:@"category"];
    NSManagedObject *almondExtract = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [almondExtract setValue:@"almond extract" forKey:@"name"];
    [almondExtract setValue:@"wet" forKey:@"category"];
    NSManagedObject *strawberries = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [strawberries setValue:@"strawberries" forKey:@"name"];
    [strawberries setValue:@"fruit" forKey:@"category"];
    NSManagedObject *strawberryGlaze = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [strawberryGlaze setValue:@"strawberry glaze" forKey:@"name"];
    [strawberryGlaze setValue:@"fruit" forKey:@"category"];
    NSManagedObject *whippedTopping = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [whippedTopping setValue:@"whipped topping" forKey:@"name"];
    [whippedTopping setValue:@"dairy" forKey:@"category"];
    NSManagedObject *pumpkinPuree = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [pumpkinPuree setValue:@"pumpkin puree" forKey:@"name"];
    [pumpkinPuree setValue:@"fruit" forKey:@"category"];
    NSManagedObject *condensedMilk = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [condensedMilk setValue:@"sweetened condensed milk" forKey:@"name"];
    [condensedMilk setValue:@"dairy" forKey:@"category"];
    NSManagedObject *pumpkinPieSpice = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [pumpkinPieSpice setValue:@"pumpkin pie spice" forKey:@"name"];
    [pumpkinPieSpice setValue:@"spice" forKey:@"category"];
    NSManagedObject *peaches = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [peaches setValue:@"peaches" forKey:@"name"];
    [peaches setValue:@"fruit" forKey:@"category"];
    NSManagedObject *lemonJuice = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [lemonJuice setValue:@"lemon juice" forKey:@"name"];
    [lemonJuice setValue:@"fruit" forKey:@"category"];
    NSManagedObject *tapioca = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [tapioca setValue:@"tapioca" forKey:@"name"];
    [tapioca setValue:@"other" forKey:@"category"];
    NSManagedObject *lemonCakeMix = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [lemonCakeMix setValue:@"lemon cake mix" forKey:@"name"];
    [lemonCakeMix setValue:@"mixes" forKey:@"category"];
    NSManagedObject *lemonExtract = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [lemonExtract setValue:@"lemon extract" forKey:@"name"];
    [lemonExtract setValue:@"wet" forKey:@"category"];
    NSManagedObject *peanutButter = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [peanutButter setValue:@"peanut butter" forKey:@"name"];
    [peanutButter setValue:@"other" forKey:@"category"];
    NSManagedObject *vanillaWafers = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [vanillaWafers setValue:@"vanilla wafers" forKey:@"name"];
    [vanillaWafers setValue:@"toppings" forKey:@"category"];
    NSManagedObject *vanillaPudding = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [vanillaPudding setValue:@"vanilla pudding mix" forKey:@"name"];
    [vanillaPudding setValue:@"mixes" forKey:@"category"];
    NSManagedObject *peanuts = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [peanuts setValue:@"peanuts" forKey:@"name"];
    [peanuts setValue:@"toppings" forKey:@"category"];
    NSManagedObject *bananas = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [bananas setValue:@"bananas" forKey:@"name"];
    [bananas setValue:@"fruit" forKey:@"category"];
    NSManagedObject *grahamCracker = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [grahamCracker setValue:@"graham cracker crumbs" forKey:@"name"];
    [grahamCracker setValue:@"toppings" forKey:@"category"];
    NSManagedObject *walnuts = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [walnuts setValue:@"walnuts" forKey:@"name"];
    [walnuts setValue:@"toppings" forKey:@"category"];
    NSManagedObject *coconut = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [coconut setValue:@"coconut" forKey:@"name"];
    [coconut setValue:@"toppings" forKey:@"category"];
    NSManagedObject *whiteCakeMix = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [whiteCakeMix setValue:@"white cake mix" forKey:@"name"];
    [whiteCakeMix setValue:@"mixes" forKey:@"category"];
    NSManagedObject *strawberryGelatin = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [strawberryGelatin setValue:@"strawberry gelatin" forKey:@"name"];
    [strawberryGelatin setValue:@"mixes" forKey:@"category"];
    NSManagedObject *sourCream = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [sourCream setValue:@"sour cream" forKey:@"name"];
    [sourCream setValue:@"dairy" forKey:@"category"];
    NSManagedObject *pretzels = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [pretzels setValue:@"pretzels" forKey:@"name"];
    [pretzels setValue:@"toppings" forKey:@"category"];
    NSManagedObject *lemonZest = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [lemonZest setValue:@"lemon zest" forKey:@"name"];
    [lemonZest setValue:@"fruit" forKey:@"category"];
    NSManagedObject *cremeDeMenthe = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [cremeDeMenthe setValue:@"creme de menthe" forKey:@"name"];
    [cremeDeMenthe setValue:@"alcohol" forKey:@"category"];
    NSManagedObject *unsweetenedChocolate = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [unsweetenedChocolate setValue:@"unsweetened chocolate" forKey:@"name"];
    [unsweetenedChocolate setValue:@"chocolate" forKey:@"category"];
    NSManagedObject *mintExtract = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [mintExtract setValue:@"mint extract" forKey:@"name"];
    [mintExtract setValue:@"wet" forKey:@"category"];
    NSManagedObject *marshmallowCreme = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [marshmallowCreme setValue:@"marshmallow creme" forKey:@"name"];
    [marshmallowCreme setValue:@"other" forKey:@"category"];
    NSManagedObject *oreoPieCrust = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [oreoPieCrust setValue:@"oreo pie crust" forKey:@"name"];
    [oreoPieCrust setValue:@"other" forKey:@"category"];
    NSManagedObject *miniMarshmallows = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [miniMarshmallows setValue:@"mini marshmallows" forKey:@"name"];
    [miniMarshmallows setValue:@"toppings" forKey:@"category"];
    NSManagedObject *grahamCrackerPieCrust = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [grahamCrackerPieCrust setValue:@"graham cracker pie crust" forKey:@"name"];
    [grahamCrackerPieCrust setValue:@"other" forKey:@"category"];
    NSManagedObject *oreo = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [oreo setValue:@"oreo cookie" forKey:@"name"];
    [oreo setValue:@"toppings" forKey:@"category"];
    NSManagedObject *chocolatePudding = [[NSManagedObject alloc] initWithEntity:ingredientEntity insertIntoManagedObjectContext:self.managedObjectContext];
    [chocolatePudding setValue:@"chocolate pudding mix" forKey:@"name"];
    [chocolatePudding setValue:@"mixes" forKey:@"category"];
    
    
    //Create ingredient Relationships
    [ccCookie setValue:[NSSet setWithObjects:cChips, salt, bakingSoda, flour, vanilla, eggs, brownSugar, sugar, butter, nil] forKey:@"needs"];
    
    [cCake setValue:[NSSet setWithObjects:butter, cocoa, flour, sugar, salt, water, buttermilk, bakingSoda, vanilla, eggs, nil] forKey:@"needs"];
    
    [vanillaCupcake setValue:[NSSet setWithObjects:vanilla, eggs, flour, salt, bakingPowder, butter, sugar, milk, nil] forKey:@"needs"];
    
    [chocolateIcing setValue:[NSSet setWithObjects:heavyCream, semisweetChocolate, vanilla, nil] forKey:@"needs"];
    
    [cheesecakeBrownie setValue:[NSSet setWithObjects:creamCheese, sugar, eggs, cChips, butter, flour, bakingPowder, salt, nil] forKey:@"needs"];
    
    [popTart setValue:[NSSet setWithObjects:pieCrust, strawberryJam, powderedSugar, milk, vanilla, sprinkles, nil] forKey:@"needs"];
    
    [caramelApplePie setValue:[NSSet setWithObjects:pieCrust, apples, flour, brownSugar, caramelDip, nil] forKey:@"needs"];
    
    [blueberryPie setValue:[NSSet setWithObjects:pieCrust, blueberries, sugar, flour, cinnamon, almondExtract, butter, milk, nil] forKey:@"needs"];
    
    [strawberryPie setValue:[NSSet setWithObjects:pieCrust, strawberries, strawberryGlaze, whippedTopping, nil] forKey:@"needs"];
    
    [pumpkinPie setValue:[NSSet setWithObjects:pieCrust, pumpkinPuree, condensedMilk, pumpkinPieSpice, eggs, nil] forKey:@"needs"];
    
    [peachBlueberryPie setValue:[NSSet setWithObjects:pieCrust, peaches, blueberries, lemonJuice, sugar, tapioca, salt, butter, nil] forKey:@"needs"];
    
    [lemonCookies setValue:[NSSet setWithObjects:lemonCakeMix, eggs, vegetableOil, lemonExtract, powderedSugar, nil] forKey:@"needs"];
    
    [peanutButterCookies setValue:[NSSet setWithObjects:peanutButter, sugar, eggs, bakingSoda, salt, vanilla, nil] forKey:@"needs"];
    
    [peanutButterBananaCreamPie setValue:[NSSet setWithObjects:vanillaWafers, butter, semisweetChocolate, peanutButter, bananas, vanillaPudding, milk, whippedTopping, peanuts, nil] forKey:@"needs"];
    
    [layeredCoconutChocolateBars setValue:[NSSet setWithObjects:semisweetChocolate, butter, grahamCracker, walnuts, coconut, creamCheese, milk, vanillaPudding, nil] forKey:@"needs"];
    
    [strawberrySwirlCake setValue:[NSSet setWithObjects:whiteCakeMix, strawberryGelatin, sourCream, powderedSugar, whippedTopping, strawberries, nil] forKey:@"needs"];
    
    [strawberryPretzelSquares setValue:[NSSet setWithObjects:pretzels, sugar, butter, creamCheese, milk, whippedTopping, water, strawberryGelatin, strawberries, nil] forKey:@"needs"];
    
    [peachShortcake setValue:[NSSet setWithObjects:flour, sugar, bakingPowder, lemonZest, creamCheese, milk, peaches, lemonJuice, whippedTopping, nil] forKey:@"needs"];
    
    [cremeDeMentheBrownies setValue:[NSSet setWithObjects:semisweetChocolate, butter, powderedSugar, cremeDeMenthe, unsweetenedChocolate, sugar, eggs, mintExtract, flour, nil] forKey:@"needs"];
    
    [grasshopperMallowPie setValue:[NSSet setWithObjects:cremeDeMenthe, marshmallowCreme, whippedTopping, oreoPieCrust, nil] forKey:@"needs"];
    
    [bananaMallowPie setValue:[NSSet setWithObjects:vanillaPudding, milk, miniMarshmallows, whippedTopping, bananas, grahamCrackerPieCrust, nil] forKey:@"needs"];
    
    [stripedDelight setValue:[NSSet setWithObjects:oreo, butter, creamCheese, sugar, milk, whippedTopping, chocolatePudding, nil] forKey:@"needs"];
    
    [vanillaSnickerdoodles setValue:[NSSet setWithObjects:flour, bakingSoda, salt, butter, brownSugar, sugar, vanillaPudding, eggs, vanilla, cinnamon, nil] forKey:@"needs"];

    
    /*
    //Create measurement relationships
    
    [ccCookie setValue:[NSSet setWithObjects:twoAndOneQuarter, oneCup, oneTsp, threeQuarterCup, two, twoCup, nil] forKey:@"hasAmount"];
    [flour setValue:[NSSet setWithObjects:twoAndOneQuarter, nil] forKey:@"needsAmount"];
    [bakingSoda setValue:[NSSet setWithObjects:oneTsp, nil] forKey:@"needsAmount"];
    [salt setValue:[NSSet setWithObjects:oneTsp, nil] forKey:@"needsAmount"];
    [butter setValue:[NSSet setWithObjects:oneCup, nil] forKey:@"needsAmount"];
    [sugar setValue:[NSSet setWithObjects:threeQuarterCup, nil] forKey:@"needsAmount"];
    [brownSugar setValue:[NSSet setWithObjects:threeQuarterCup, nil] forKey:@"needsAmount"];
    [vanilla setValue:[NSSet setWithObjects:oneTsp, nil] forKey:@"needsAmount"];
    [eggs setValue:[NSSet setWithObjects:two, nil] forKey:@"needsAmount"];
    [cChips setValue:[NSSet setWithObjects:twoCup, nil] forKey:@"needsAmount"];
    */
    
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
    if (![heavyCream.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![semisweetChocolate.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![creamCheese.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![pieCrust.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![strawberryJam.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![powderedSugar.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![sprinkles.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![apples.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![caramelDip.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![blueberries.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![almondExtract.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![strawberries.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![strawberryGlaze.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![whippedTopping.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![pumpkinPuree.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![condensedMilk.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![pumpkinPieSpice.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![peaches.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![lemonJuice.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![tapioca.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![lemonCakeMix.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![lemonExtract.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![peanutButter.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![vanillaWafers.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![vanillaPudding.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![peanuts.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![bananas.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![grahamCracker.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![walnuts.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![coconut.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![whiteCakeMix.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![strawberryGelatin.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![sourCream.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![pretzels.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![lemonZest.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![cremeDeMenthe.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![unsweetenedChocolate.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![mintExtract.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![chocolateIcing.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![cheesecakeBrownie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![popTart.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![caramelApplePie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![blueberryPie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![strawberryPie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![pumpkinPie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![peachBlueberryPie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![lemonCookies.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![peanutButterCookies.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![peanutButterBananaCreamPie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![layeredCoconutChocolateBars.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![strawberrySwirlCake.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![strawberryPretzelSquares.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![peachShortcake.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![cremeDeMentheBrownies.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![marshmallowCreme.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![oreoPieCrust.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![grasshopperMallowPie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![grahamCrackerPieCrust.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![miniMarshmallows.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![bananaMallowPie.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![oreo.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![chocolatePudding.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![stripedDelight.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![vanillaSnickerdoodles.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }

    /*
    if (![oneTsp.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![oneCup.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![twoCup.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![two.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![twoAndOneQuarter.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    if (![threeQuarterCup.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
     */
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self customizeAppearance];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"]) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Ingredient"];
        NSError *fetchError = nil;
        NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
        if(!fetchError){
            for (NSManagedObject *managedObject in result) {
                [managedObject setValue:@NO forKey:@"selected"];
            }
        }
        else{
            NSLog(@"Error fetching data.");
            NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
        }
        NSError *error = nil;
        for (NSManagedObject *managedObject in result) {
            if (![managedObject.managedObjectContext save:&error]) {
                NSLog(@"Unable to save managed object context.");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }
        }

    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //This is the first launch ever.
        
        [self loadSampleData];
    }
    
    //Fetch Main Storyboard
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //Instantiate Root Navigation Controller
    UINavigationController *rootNavigationController = (UINavigationController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"rootNavigationController"];
    
    //Configure View Controller
    ViewController *viewController = (ViewController *)[rootNavigationController topViewController];
    
    if([viewController isKindOfClass:[ViewController class]]){
        [viewController setManagedObjectContext:self.managedObjectContext];
    }
    
    //Configure Window
    [self.window setRootViewController:rootNavigationController];
    
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
