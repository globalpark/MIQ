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
    
    self.tituloLabel.text = [self.eventoPFObject objectForKey:@"titulo"];
    self.artistaLabel.text = [self.eventoPFObject objectForKey:@"artista"];
    self.descripcionLabel.text = [self.eventoPFObject objectForKey:@"descripcion"];
    self.lugarLabel.text = [(NSString *)[self.eventoPFObject objectForKey:@"ubicacion"] uppercaseString];
    NSDate *fecha = [self.eventoPFObject objectForKey:@"fecha"];
    NSString *fechaHora = [NSString stringWithFormat: @"%@", fecha];
    self.fechaHoraLabel.text = fechaHora;
    NSNumber *precio = [self.eventoPFObject objectForKey:@"precio"];
    
    self.favoritoImageView.hidden = YES;
    
    if( [precio isEqual:@0] ){
        self.precioLabel.text = @"ENTRADA LIBRE";
    }else{
        self.precioLabel.text = [NSString stringWithFormat: @"$%@", precio];
    }
    
    self.favoritoRelation = [[PFUser currentUser] objectForKey:@"favorito"];
    PFQuery *query = [self.favoritoRelation query];
    [query  findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }else{
            self.favoritos = objects;
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
    // Dispose of any resources that can be recreated.
}


- (IBAction)markFavorite:(id)sender {
    
    if(![self isFavorito]){
        self.favoritoImageView.image = [UIImage imageNamed:@"favorito_active"];
        [self.favoritoRelation addObject:self.eventoPFObject];
        [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }else{
        self.favoritoImageView.image = [UIImage imageNamed:@"favorito"];
        [self.favoritoRelation removeObject:self.eventoPFObject];
        [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
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

@end
