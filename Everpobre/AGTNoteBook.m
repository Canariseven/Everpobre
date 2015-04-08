#import "AGTNoteBook.h"

@interface AGTNoteBook ()

// Private interface goes here.

@end

@implementation AGTNoteBook

+(instancetype)notebookWithName:(NSString *)name
                        context:(NSManagedObjectContext *)context{
    
    AGTNoteBook *nb = [self insertInManagedObjectContext:context];
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}

@end
