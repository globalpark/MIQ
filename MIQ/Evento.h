//
//  Evento.h
//  MIQ
//
//  Created by Work Station on 7/14/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Evento : NSObject
@property (nonatomic, strong) NSString *nombreEvento;
@property (nonatomic, strong) NSDate *fechaEvento;
@property (nonatomic, strong) NSString *lugarEvento;

//Artistas incluye Director
@property (nonatomic, strong) NSArray *artistasEvento;
@property (nonatomic, strong) NSString *descripcionEvento;
@property (nonatomic) double precioEvento;

// Tipos de Evento: Cine, Arte, Música, Letras, Artes escénicas y Exposiciones temporales
@property (nonatomic,strong) NSString *tipoEvento;












@end
