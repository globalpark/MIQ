//
//  MIQMapaViewController.m
//  MIQ
//
//  Created by Work Station on 7/23/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MIQMapaViewController.h"

@interface MIQMapaViewController ()
@property(strong,nonatomic) UILabel *label;
@property(strong,nonatomic) UIImage *leyendaA;
@property(strong,nonatomic) UIImage *leyendaB;
@property(strong,nonatomic) UIImage *plantaA;
@property(strong,nonatomic) UIImage *plantaB;
@property(strong,nonatomic) UISegmentedControl *segmControl;
@property(strong,nonatomic) UIScrollView *scrollMapa;
@property(strong,nonatomic) UIView *container;
@property(strong,nonatomic) UIImageView *viewMapa;
@property(strong,nonatomic) UIImageView *viewLeyenda;

@end

@implementation MIQMapaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //-------- Create Container View --------//
    
    self.container = [[UIView alloc] initWithFrame:(CGRectMake(0, 93, 320, 425))];

    [self.view addSubview:self.container];
    
    
    //-------- Image View Map Legend --------//
    
    self.viewLeyenda = [[UIImageView alloc]initWithFrame:CGRectMake(10, 395, 300, 50)];
    [self.container addSubview:self.viewLeyenda];
    
    //-------- Images Legend --------//
    
    self.leyendaB = [UIImage imageNamed:@"leyendaB"];
    self.leyendaA = [UIImage imageNamed:@"leyendaA"];
    
    
    //-------- Image View Map --------//
    
    self.viewMapa = [[UIImageView alloc]init];
    
    
    //-------- Images Map --------//
    
    self.plantaB = [UIImage imageNamed:@"mapaB"];
    self.plantaA= [UIImage imageNamed:@"mapaA"];
    
    
    
    //-------- Scroll View --------//
    
    self.scrollMapa = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, 320, 354))];
    self.scrollMapa.contentMode = UIViewContentModeScaleAspectFill;
    [self.container addSubview:self.scrollMapa];
    [self.scrollMapa addSubview:self.viewMapa];
    
    /*
    //-------- Label --------//
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(10, 10, 300, 40);
    self.label.textAlignment = NSTextAlignmentCenter;
    */
    
    //-------- Array --------//
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Planta Baja", @"Planta Alta", nil];
    
    
    //-------- Segmented Control --------//
    
    self.segmControl = [[UISegmentedControl alloc]initWithItems:itemArray];
    [self.segmControl setFrame:CGRectMake(0, 0, 320, 30)];
    
    [self.segmControl addTarget:self
                         action:@selector(plantaSeleccionada:)
               forControlEvents:UIControlEventValueChanged];
    UIFont *font = [UIFont fontWithName:@"AvenirNext-Medium"];
    
    [self.segmControl setTitleTextAttributes:attributes
                                    forState:UIControlStateNormal];
    
    
    
    
    
    
    

    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont fontWithName:@"AvenirNext-Regular" size:12], UITextAttributeFont,
                                [UIColor colorWithRed:0.0/255 green:89.0/255 blue:143.0/255 alpha:1], UITextAttributeTextColor, nil];
    [self.segmControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont fontWithName:@"AvenirNext-Demibold" size:12], UITextAttributeFont,
                                [UIColor colorWithRed:0.0/255 green:89.0/255 blue:143.0/255 alpha:1], UITextAttributeTextColor, nil];

    
}






-(void) plantaSeleccionada:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    self.label.text = [segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]];
    switch ([segmentedControl selectedSegmentIndex]) {
        case 0:
            // Añadir imagen planta baja a la vista
            [self.viewMapa setImage:self.plantaB];
            
            // Añadir imagen leyenda planta baja a la vista
            [self.viewLeyenda setImage:self.leyendaB];
            // hacer bold la letra del label
            // MISSING!//
            break;
            
        default:
            // Añadir imagen planta baja a la vista
            [self.viewMapa setImage:self.plantaA];
            
            // Añadir imagen leyenda planta baja a la vista
            [self.viewLeyenda setImage:self.leyendaA];
            // hacer bold la letra del label
            // MISSING!//
            break;
    }
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
