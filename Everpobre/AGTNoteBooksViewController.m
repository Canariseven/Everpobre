//
//  AGTNoteBooksViewController.m
//  Everpobre
//
//  Created by Carmelo Ruymán Quintana Santana on 8/4/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTNoteBooksViewController.h"
#import "AGTNoteBook.h"
@interface AGTNoteBooksViewController ()

@end

@implementation AGTNoteBooksViewController
-(void)viewDidLoad{
    self.title = @"EverPobre";
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

@end
