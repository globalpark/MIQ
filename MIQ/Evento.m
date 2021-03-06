//
//  Evento.m
//  MIQ
//
//  Created by Work Station on 7/14/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "Evento.h"

@implementation Evento

- (id) initWithParseObject: (PFObject *) parseEvent{
    self = [super init];
    
    if(self){
        self.parseEvent = parseEvent;
        self.eventId = parseEvent.objectId;
        self.nombreEvento = parseEvent[@"titulo"];
        self.fechaEvento = [self stringToNSDate:parseEvent[@"fecha"]];
        self.ubicacionEvento = parseEvent[@"lugar"];
        self.artistasEvento = parseEvent[@"artistas"];
        self.descripcionEvento = parseEvent[@"descripcion"];
        self.precioEvento = parseEvent[@"precio"];
        self.tipoEvento = parseEvent[@"tipo"];
        
        PFFile *imageFile = parseEvent[@"imagen"];
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if(!error){
                self.imagenEvento = [UIImage imageWithData:data];
            }else{
                NSLog(@"Error al obtener imagen: %@ %@", error, [error userInfo]);
                self.imagenEvento = nil;
            }
        }];
    }
    
    
    return self;
}

+ (id) eventoWithPFObject: (PFObject *) parseEvent{
    return [[self alloc] initWithParseObject:parseEvent];
}

- (NSDate *) stringToNSDate: (NSString *) date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter  setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:date];
    return tempDate;
}

@end
