#import "AGTNote.h"
#import "AGTPhoto.h"
@interface AGTNote ()

// Private interface goes here.

@end

@implementation AGTNote

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

@end
