//
//  AppDelegate.m
//  Everpobre
//
//  Created by Carmelo Ruymán Quintana Santana on 7/4/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//
#import "AGTNote.h"
#import "AGTNoteBook.h"
#import "AGTCoreDataStack.h"
#import "AGTNoteBooksViewController.h"
#import "AppDelegate.h"
#import "UIViewController+Navigation.h"
@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack * stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    // Creamos una instancia del stack
    self.stack  = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    // Creamos datos chorras
    [self createDummyData];
    
    // Un fetchRequest
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[AGTNoteBook entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AGTNoteBookAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:AGTNoteBookAttributes.modificationDate
                                                          ascending:NO]];
    req.fetchBatchSize = 20;
    // FetchedResultsController
    NSFetchedResultsController * fc= [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:self.stack.context
                                      sectionNameKeyPath:nil
                                      cacheName:nil];
    // Creamos el controlador
    AGTNoteBooksViewController *nVC= [[AGTNoteBooksViewController alloc] initWithFetchedResultsController:fc style:UITableViewStylePlain];
    self.window.rootViewController = [nVC wrappedInNavigation];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
}

#pragma mark - Utils
-(void) createDummyData{
    // Elimino datos anteriores
    [self.stack zapAllData];
    
    AGTNoteBook *exs = [AGTNoteBook notebookWithName:@"Ex-novias para el recuerdo"
                                             context:self.stack.context];
    [AGTNote noteWithName:@"Mariana Dávalos"
                 notebook:exs
                  context:self.stack.context];
    [AGTNote noteWithName:@"Camila Dávalos"
                 notebook:exs
                  context:self.stack.context];
    [AGTNote noteWithName:@"Pampita"
                 notebook:exs
                  context:self.stack.context];
    AGTNote *vega = [AGTNote noteWithName:@"María Teresa de la Vega"
                                 notebook:exs
                                  context:self.stack.context];
    
    NSLog(@"Una nota: %@",vega);
    
    // Buscar
    NSFetchRequest *req = [NSFetchRequest
                           fetchRequestWithEntityName:[AGTNote entityName]];
    
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AGTNoteAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:AGTNoteAttributes.modificationDate
                                                          ascending:NO]];
    req.fetchBatchSize = 20;
    req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@",exs];
    NSArray *results = [self.stack executeFetchRequest:req
                                            errorBlock:^(NSError *error) {
                                                NSLog(@"Error al buscar! %@",error.localizedDescription);
                                            }];
    
    NSLog(@"%@",results);
    
    // Borrar
    [self.stack.context deleteObject:vega];
    
    //Guardar
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar! %@",error);
    }];
}

@end











