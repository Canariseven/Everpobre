//
//  AGTNotesViewController.m
//  Everpobre
//
//  Created by Carmelo Ruymán Quintana Santana on 9/4/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTNotesViewController.h"
#import "AGTNote.h"
#import "AGTPhoto.h"
#import "AGTNoteBook.h"

@interface AGTNotesViewController ()
@property (nonatomic, strong) AGTNoteBook *notebook;
@end


@implementation AGTNotesViewController
-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook:(AGTNoteBook *)notebook{
    
    if (self = [super initWithFetchedResultsController:aFetchedResultsController
                                                 style:aStyle]) {
        _notebook = notebook;

    }
    return self;
}
-(void) viewDidLoad{
    [super viewDidLoad];
    self.title = self.notebook.name;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AGTNote * n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    static NSString *noteCellId = @"NoteCellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:noteCellId];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:noteCellId];
    }
    
    cell.imageView.image = n.photo.image;
    cell.textLabel.text = n.name;
    cell.detailTextLabel.text = n.text;
    return cell;
}


@end
