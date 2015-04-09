//
//  AGTNotesViewController.h
//  Everpobre
//
//  Created by Carmelo Ruymán Quintana Santana on 9/4/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class AGTNoteBook;
@interface AGTNotesViewController : AGTCoreDataTableViewController
-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook:(AGTNoteBook *)notebook;
@end
