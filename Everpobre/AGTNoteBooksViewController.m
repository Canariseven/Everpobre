//
//  AGTNoteBooksViewController.m
//  Everpobre
//
//  Created by Carmelo Ruymán Quintana Santana on 8/4/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTNoteBooksViewController.h"
#import "AGTNoteBook.h"
#import "AGTNotesViewController.h"
#import "AGTNote.h"
@interface AGTNoteBooksViewController ()

@end

@implementation AGTNoteBooksViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"EverPobre";
    [self addNewNoteBookButton];
    
    // Edit Button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar cual es la libreta
    AGTNoteBook * notebook = [self.fetchedResultsController
                              objectAtIndexPath:indexPath];
    // Crear una celda
    static NSString *cellID = @"noteBookCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1
                                     reuseIdentifier:cellID];
    }
    // Configurarla (sincronizar libreta -> celda)
    cell.textLabel.text = notebook.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Notas: %lu", (unsigned long)[notebook.notes count]];
    // Devolverla
    return cell;
    
}
-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{

    AGTNoteBook *nt = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self.fetchedResultsController.managedObjectContext deleteObject:nt];
}

#pragma mark - Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AGTNoteBook *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AGTNote entityName]];
                           
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AGTNoteAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:AGTNoteAttributes.modificationDate
                                                          ascending:NO]];
    req.fetchBatchSize = 20;
    
    req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@", n];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:n.managedObjectContext sectionNameKeyPath:nil
                                      cacheName:nil];

    AGTNotesViewController * nVC = [[AGTNotesViewController alloc]
                                    initWithFetchedResultsController:fc
                                    style:UITableViewStyleGrouped
                                    notebook:n];
    [self.navigationController pushViewController:nVC animated:YES];
    
    
}

#pragma mark - Utils
-(void)addNewNoteBookButton{
    UIBarButtonItem * add = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                             target:self
                             action:@selector(addNewNoteBook:)];
    
    self.navigationItem.rightBarButtonItem = add;
}
#pragma mark - Actions
-(void)addNewNoteBook:(id)sender{
    [AGTNoteBook notebookWithName:@"Nueva libreta"
                          context:self.fetchedResultsController.managedObjectContext];
}
@end
