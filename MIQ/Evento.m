//
//  Evento.m
//  MIQ
//
//  Created by Work Station on 7/14/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "Evento.h"

@implementation Evento


-(void)initWithParseObject:(PFObject *)parseEvent{
    self.parseEvent = parseEvent;
    self.eventId = parseEvent.objectId;
    self.nombreEvento = parseEvent[@"nombre"];
    self.fechaEvento = [self stringToNSDate:parseEvent[@"fecha"]];
    self.lugarEvento = parseEvent[@"lugar"];
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

-(NSDate *)stringToNSDate:(NSString *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter  setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:date];
    return tempDate;
}

@end
