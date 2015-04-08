//
//  AGTEverpobreBaseClass.m
//  Everpobre
//
//  Created by Carmelo Ruymán Quintana Santana on 8/4/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTEverpobreBaseClass.h"

@implementation AGTEverpobreBaseClass
#pragma  mark - Class methods
+(NSArray *)observableKeys{
    return @[];
}

#pragma mark - Life cycle
-(void)awakeFromInsert{
    [super awakeFromInsert];
    
    // Solo se produce una vez en la vida del objeto
    [self setupKVO];
}

-(void)awakeFromFetch{
    [super awakeFromFetch];
    // Se produce n veces a lo largo de la vida del objeto
    [self setupKVO];
}


-(void)willTurnIntoFault{
    [super willTurnIntoFault];
    // Se produce cuando el objeto se vacia convirtiéndose en un fault
    // Baja en las notificaciones
    [self tearDownKVO];
    
    
}

#pragma mark - KVO
-(void) setupKVO{
    for (NSString *key in [[self class] observableKeys]){
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
    }
}

-(void) tearDownKVO{
    // Me doy de baja de todas las notificaciones
    for (NSString *key in [[self class] observableKeys]){
        [self removeObserver:self
                  forKeyPath:key];
    }
}

@end
