#import "_AGTNote.h"

@interface AGTNote : _AGTNote {}
+(instancetype) noteWithName:(NSString *)name
                    notebook:(AGTNoteBook *)notebook
                     context:(NSManagedObjectContext *)context;
@end
