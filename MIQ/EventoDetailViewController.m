//
//  EventoDetailViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 9/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "EventoDetailViewController.h"
#import <Parse/Parse.h>

@interface EventoDetailViewController ()

@end

@implementation EventoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) viewWillAppear:(BOOL)animated{
    
    //Hide the Favorite Button while we figure out if it is a favorite or not.
    self.favoritoImageView.hidden = YES;
    
    //Set Labels from PFObject Evento.
    self.tituloLabel.text = [self.eventoPFObject objectForKey:@"titulo"];
    self.artistaLabel.text = [self.eventoPFObject objectForKey:@"artista"];
    self.descripcionLabel.text = [self.eventoPFObject objectForKey:@"descripcion"];
    self.lugarLabel.text = [(NSString *)[self.eventoPFObject objectForKey:@"ubicacion"] uppercaseString];
    
    //Get the Date as an NSDate
    NSDate *fecha = [self.eventoPFObject objectForKey:@"fecha"];
    
    //Convert NSDate to String and add to Label
    self.fechaHoraLabel.text = [[self dateStringFromDate:fecha] uppercaseString];
    
    //Get the Price
    NSNumber *precio = [self.eventoPFObject objectForKey:@"precio"];
    
    //Set Label depending on Price.
    if( [precio isEqual:@0] ){
        self.precioLabel.text = @"ENTRADA LIBRE";
    }else{
        self.precioLabel.text = [NSString stringWithFormat: @"$%@", precio];
    }
    
    //Get the Favorites Relation to User
    self.favoritoRelation = [[PFUser currentUser] objectForKey:@"favorito"];
    
    //Query Parse for a set containing all of the User's Favorites
    PFQuery *query = [self.favoritoRelation query];
    [query  findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }else{ //We got something back
            self.favoritos = objects; //Set array with the result
            //Choose the correct image and show it.
            if([self isFavorito]){
                self.favoritoImageView.image = [UIImage imageNamed:@"favorito_active"];
                self.favoritoImageView.hidden = NO;
            }else{
                self.favoritoImageView.image = [UIImage imageNamed:@"favorito"];
                self.favoritoImageView.hidden = NO;
            }
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)markFavorite:(id)sender {
    
    //Check if Evento belongs to Favorites
    if(![self isFavorito]){
        
        //Update button
        self.favoritoImageView.image = [UIImage imageNamed:@"favorito_active"];
        
        //Add event to PFRelation
        [self.favoritoRelation addObject:self.eventoPFObject];
        
        //Update in Background
        [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
        
        //Add to Favoritos Array
        [self.favoritos addObject:self.eventoPFObject];
    }else{
        
        //Update button
        self.favoritoImageView.image = [UIImage imageNamed:@"favorito"];
        
        //Remove event to PFRelation
        [self.favoritoRelation removeObject:self.eventoPFObject];
        
        //Update in Background
        [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
        
        //Remove from Favoritos Array
        [self.favoritos removeObject:self.eventoPFObject];
    }
    
}

-(BOOL) isFavorito{
    for (PFObject *favorito in self.favoritos) {
        if ([favorito.objectId isEqualToString:self.eventoPFObject.objectId]){
            return YES;
        }
    }
    return NO;
}

-(NSString *)dateStringFromDate:(NSDate *)date{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatter setDateFormat:@"MMMM dd, HH:mm"];
    
    return [formatter stringFromDate:date];
    
}

@end
