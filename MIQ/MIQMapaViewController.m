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
@property(strong, nonatomic) UINavigationBar *barraNav;

@end

@implementation MIQMapaViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //-------- Initial Setup --------//
    
    self.title = @"MAPA DEL MUSEO";
    
    self.barraNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    [self.barraNav setBarTintColor:[UIColor redColor]];
    [self.view addSubview:self.barraNav];
    
    
    //-------- Add Navigation Bar Item --------//
    
    
    //-------- Create Container View --------//
    
    self.container = [[UIView alloc] initWithFrame:(CGRectMake(0, 93, 320, 425))];

    [self.view addSubview:self.container];
    
    
    //-------- Image View Map Legend --------//
    
    self.viewLeyenda = [[UIImageView alloc]initWithFrame:CGRectMake(0, 376, 320, 50)];
    
    
    //-------- Images Legend --------//
    
    self.leyendaB = [UIImage imageNamed:@"leyendaB"];
    self.leyendaA = [UIImage imageNamed:@"leyendaA"];
    
    
    //-------- Image View Map --------//
    
    self.viewMapa = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 261, 291)];
    
    
    //-------- Images Map --------//
    
    self.plantaB = [UIImage imageNamed:@"mapaB"];
    self.plantaA= [UIImage imageNamed:@"mapaA"];
    
    
    
    //-------- Scroll View --------//
    
    self.scrollMapa = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 30, 320, 345))];
    //self.scrollMapa.contentMode = UIViewContentModeScaleAspectFill;
    self.scrollMapa.minimumZoomScale = 1.0f;
    self.scrollMapa.maximumZoomScale = 2.5f;
    self.scrollMapa.delegate = self;
    
    /*
    //-------- Label --------//
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(10, 10, 300, 40);
    self.label.textAlignment = NSTextAlignmentCenter;
    */
    
    //-------- Array --------//
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"PLANTA BAJA", @"PLANTA ALTA", nil];
    
    
    //-------- Segmented Control --------//
    
    self.segmControl = [[UISegmentedControl alloc]initWithItems:itemArray];
    [self.segmControl setFrame:CGRectMake(0, 0, 320, 30)];
    self.segmControl.selectedSegmentIndex = 0;
    [self.segmControl addTarget:self
                         action:@selector(plantaSeleccionada:)
               forControlEvents:UIControlEventValueChanged];

    
    // Atributes for normal button
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont fontWithName:@"AvenirNext-Regular" size:12],
                                NSFontAttributeName,
                                [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1],
                                NSForegroundColorAttributeName,
                                nil];
    
    [self.segmControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    
    
    
    // Atributes for highlighted button
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIFont fontWithName:@"AvenirNext-Demibold" size:12],
                                           NSFontAttributeName,
                                           [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1],
                                           NSForegroundColorAttributeName,
                                           nil];

    [self.segmControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateSelected];

    
    
    //-------- Initial Load -------//
    
    [self.viewMapa setImage:self.plantaB];
    [self.viewLeyenda setImage:self.leyendaB];
    
    //-------- Add Views --------//
    
    [self.view addSubview:self.container];
    [self.container addSubview:self.scrollMapa];
    [self.container insertSubview: self.viewLeyenda aboveSubview:self.scrollMapa];
    [self.scrollMapa addSubview:self.viewMapa];
    [self.container addSubview:self.segmControl];
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
            break;
            
        default:
            // Añadir imagen planta baja a la vista
            [self.viewMapa setImage:self.plantaA];
            
            // Añadir imagen leyenda planta baja a la vista
            [self.viewLeyenda setImage:self.leyendaA];
            break;
    }
    
}





- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.viewMapa;
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
