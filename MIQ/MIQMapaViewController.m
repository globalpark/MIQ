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
    
    self.title = @"MAPA";
    
    // Navigation Bar
    UIImageView *barSimulada = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navbarCON"]];
    [barSimulada setFrame:CGRectMake(0, 0, 320, 64)];
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(141, 38, 0, 0)];
    UILabel *titulo =[[UILabel alloc]initWithFrame:CGRectMake(129, 34, 60, 20)];
    titulo.text = self.title;
    titulo.textAlignment =NSTextAlignmentCenter;
    titulo.font = [UIFont fontWithName:@"AvenirNext-Medium" size:14];
    titulo.textColor = [UIColor colorWithRed:244.0/255.f green:244.0/255.f blue:244.0/255.f alpha:1.0];
    
    // Add Views
    [titleView addSubview:titulo];
    [barSimulada addSubview:titulo];
    [self.view addSubview:barSimulada];
    
    
    //-------- Create Container View --------//
    
    self.container = [[UIView alloc] initWithFrame:(CGRectMake(0, 64, 320, 425))];
    
    [self.view addSubview:self.container];
    
    
    //-------- Image View Map Legend --------//
    
    self.viewLeyenda = [[UIImageView alloc]initWithFrame:CGRectMake(0, 405, 320, 50)];
    
    
    //-------- Images Legend --------//
    
    self.leyendaB = [UIImage imageNamed:@"leyendaB"];
    self.leyendaA = [UIImage imageNamed:@"leyendaA"];
    
    
    //-------- Image View Map --------//
    
    self.viewMapa = [[UIImageView alloc]initWithFrame:CGRectMake(30, 37, 261, 291)];
    //self.viewMapa.backgroundColor = [UIColor blackColor];
    
    
    //-------- Images Map --------//
    
    self.plantaB = [UIImage imageNamed:@"mapaB"];
    self.plantaA= [UIImage imageNamed:@"mapaA"];
    
    
    //-------- Scroll View --------//
    
    self.scrollMapa = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 35, 320, 375))];
    //self.scrollMapa.backgroundColor = [UIColor redColor];
    self.scrollMapa.minimumZoomScale = 1.0f;
    self.scrollMapa.maximumZoomScale = 2.5f;
    self.scrollMapa.delegate = self;
    
    //-------- Array --------//
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"PLANTA BAJA", @"PLANTA ALTA", nil];
    
    //-------- Segmented Control --------//
    
    self.segmControl = [[UISegmentedControl alloc]initWithItems:itemArray];
    [self.segmControl setFrame:CGRectMake(0, 0, 320, 35)];
    self.segmControl.selectedSegmentIndex = 0;
    [self.segmControl addTarget:self
                         action:@selector(plantaSeleccionada:)
               forControlEvents:UIControlEventValueChanged];
    
    // Set divider images
    [self.segmControl setDividerImage:[UIImage imageNamed:@"corner_selected"]
                  forLeftSegmentState:UIControlStateNormal
                    rightSegmentState:UIControlStateNormal
                           barMetrics:UIBarMetricsDefault];
    [self.segmControl setDividerImage:[UIImage imageNamed:@"corner_selected"]
                  forLeftSegmentState:UIControlStateSelected
                    rightSegmentState:UIControlStateNormal
                           barMetrics:UIBarMetricsDefault];
    [self.segmControl setDividerImage:[UIImage imageNamed:@"corner_selected"]
                  forLeftSegmentState:UIControlStateNormal
                    rightSegmentState:UIControlStateSelected
                           barMetrics:UIBarMetricsDefault];
    
    // Set background images
    UIImage *normalBackgroundImage = [UIImage imageNamed:@"background_deselected"];
    [self.segmControl setBackgroundImage:normalBackgroundImage
                                forState:UIControlStateNormal
                              barMetrics:UIBarMetricsDefault];
    UIImage *selectedBackgroundImage = [UIImage imageNamed:@"background_selectedDark"];
    [self.segmControl setBackgroundImage:selectedBackgroundImage
                                forState:UIControlStateSelected
                              barMetrics:UIBarMetricsDefault];
    
    
    // Adjust text
    [self.segmControl setContentPositionAdjustment:UIOffsetMake(0, 2) forSegmentType: UISegmentedControlSegmentLeft barMetrics:UIBarMetricsDefault];
    [self.segmControl setContentPositionAdjustment:UIOffsetMake(0, 2) forSegmentType: UISegmentedControlSegmentRight barMetrics:UIBarMetricsDefault];
    
    
    
    
    
    
    
    
    
    
    
    
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

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.viewMapa;
}



//---- Change status bar to Light theme ----//

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
