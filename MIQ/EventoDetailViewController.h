//
//  EventoDetailViewController.h
//  MIQ
//
//  Created by Luis Mendoza on 9/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EventoDetailViewController : UIViewController
@property (strong, nonatomic) PFObject *eventoPFObject;
@property (strong, nonatomic) IBOutlet UILabel *tituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistaLabel;
@property (strong, nonatomic) IBOutlet UIImageView *eventoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *favoritoImageView;
@property (strong, nonatomic) IBOutlet UILabel *fechaHoraLabel;
@property (strong, nonatomic) IBOutlet UILabel *lugarLabel;
@property (strong, nonatomic) IBOutlet UILabel *precioLabel;
@property (strong, nonatomic) IBOutlet UILabel *descripcionLabel;
@property (strong, nonatomic) NSArray *favoritos;
@property (strong, nonatomic) PFRelation *favoritoRelation;
- (IBAction)markFavorite:(id)sender;

@end
