// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTPhoto.h instead.

@import CoreData;
#import "AGTEverpobreBaseClass.h"

extern const struct AGTPhotoAttributes {
	__unsafe_unretained NSString *photoData;
} AGTPhotoAttributes;

extern const struct AGTPhotoRelationships {
	__unsafe_unretained NSString *notes;
} AGTPhotoRelationships;

@class AGTNote;

@interface AGTPhotoID : NSManagedObjectID {}
@end

@interface _AGTPhoto : AGTEverpobreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AGTPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _AGTPhoto (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(AGTNote*)value_;
- (void)removeNotesObject:(AGTNote*)value_;

@end

@interface _AGTPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
