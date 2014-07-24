//
//  MIQMapaViewController.m
//  MIQ
//
//  Created by Work Station on 7/23/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MIQMapaViewController.h"

@interface MIQMapaViewController ()

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
    
     UIView *container = [[UIView alloc] initWithFrame:(CGRectMake(0, 93, 320, 425))];
    [self.view addSubview:container];
    
    //-------- Create View Planta Baja --------//
    UIView *viewPlantaBaja = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 320, 354))];
    
    UIScrollView *scrollPlantaBaja = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, 320, 354))];
    scrollPlantaBaja.contentMode = UIViewContentModeScaleAspectFill;
    UIImage *imgMapa = [UIImage imageNamed:@"planta_baja"];
    UIImageView *mapaPlantaBaja = [[UIImageView alloc] initWithImage:imgMapa];
    [mapaPlantaBaja setFrame:CGRectMake(0, 0, 320, 391)];
    mapaPlantaBaja.contentMode = UIViewContentModeScaleAspectFill;
    [scrollPlantaBaja addSubview:mapaPlantaBaja];
    
    
    UIImage *imgLeyenda = [UIImage imageNamed:@"home1"];
    UIImageView *leyendaPlantaBaja = [[UIImageView alloc] initWithImage:imgLeyenda];
    [leyendaPlantaBaja setFrame:(CGRectMake(0, 344, 320, 80))];

    
    [viewPlantaBaja addSubview:scrollPlantaBaja];
    [viewPlantaBaja addSubview:leyendaPlantaBaja];
    
    
    
    [container insertSubview:viewPlantaBaja atIndex:1];
    
    
    //-------- Create View Planta Alta --------//
    UIView *viewPlantaAlta = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 320, 354))];
    
    
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
