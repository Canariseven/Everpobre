// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTNoteBook.m instead.

#import "_AGTNoteBook.h"

const struct AGTNoteBookAttributes AGTNoteBookAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
};

const struct AGTNoteBookRelationships AGTNoteBookRelationships = {
	.notes = @"notes",
};

@implementation AGTNoteBookID
@end

@implementation _AGTNoteBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"NoteBook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"NoteBook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"NoteBook" inManagedObjectContext:moc_];
}

- (AGTNoteBookID*)objectID {
	return (AGTNoteBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

