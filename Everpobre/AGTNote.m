#import "AGTNote.h"
#import "AGTPhoto.h"
@interface AGTNote ()

// Private interface goes here.

@end

@implementation AGTNote

#pragma mark - Class Methods
+(NSArray *)observableKeys{
    return @[AGTNoteAttributes.name,
             AGTNoteAttributes.text,
             AGTNoteRelationships.notebook,
             @"photo.photoData"];
}
+(instancetype) noteWithName:(NSString *)name
                    notebook:(AGTNoteBook *)notebook
                     context:(NSManagedObjectContext *)context{
    AGTNote * note = [self insertInManagedObjectContext:context];
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    note.photo = [AGTPhoto insertInManagedObjectContext:context];
    return note;
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    // Actualizo la modificatión
    self.modificationDate = [NSDate date];
}
@end
