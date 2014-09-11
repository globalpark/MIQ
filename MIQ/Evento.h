//
//  Evento.h
//  MIQ
//
//  Created by Work Station on 7/14/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Evento : NSObject

@property (nonatomic, strong) PFObject *parseEvent;
@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) NSString *diaEvento;
@property (nonatomic, strong) NSString *nombreEvento;
@property (nonatomic, strong) NSDate *fechaEvento;
@property (nonatomic, strong) NSString *ubicacionEvento;

//Artistas incluye Director
@property (nonatomic, strong) NSArray *artistasEvento;
@property (nonatomic, strong) NSString *descripcionEvento;
@property (nonatomic, strong) NSString *precioEvento;
@property (nonatomic, strong) UIImage *imagenEvento;

// Tipos de Evento: Cine, Arte, Música, Letras, Artes escénicas y Exposiciones temporales
@property (nonatomic,strong) NSString *tipoEvento;

- (id) initWithParseObject: (PFObject *) parseEvent;
- (NSDate *) stringToNSDate: (NSString *) date;

@end
