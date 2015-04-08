#import "AGTNoteBook.h"

@interface AGTNoteBook ()

// Private interface goes here.

@end

@implementation AGTNoteBook
+(NSArray *)observableKeys{
    return @[AGTNoteBookAttributes.name,AGTNoteBookRelationships.notes];
}

+(instancetype)notebookWithName:(NSString *)name
                        context:(NSManagedObjectContext *)context{
    
    AGTNoteBook *nb = [self insertInManagedObjectContext:context];
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    // Actualizo la modificatión
    self.modificationDate = [NSDate date];
    
}
@end
