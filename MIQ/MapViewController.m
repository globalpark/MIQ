//
//  MapViewController.m
//  MIQ
//
//  Created by Work Station on 7/21/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MapViewController.h"
#import "MapAnnotation.h"
#import "MapAnnotationView.h"

#define MIQ_LATITUDE 21.014495
#define MIQ_LONGITUDE -101.252017

@interface MapViewController ()

@end

@implementation MapViewController 



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mapView setMapType:0];
    [self.mapView setShowsUserLocation:YES];
    
    
    
    MKCoordinateRegion region;
    region.center.latitude = MIQ_LATITUDE;
    region.center.longitude = MIQ_LONGITUDE;
    region.span.latitudeDelta = 0.0002f;
    region.span.longitudeDelta = 0.0002f;
    [self.mapView setRegion:region animated:YES];
    
    self.title = @"¿CÓMO LLEGAR?";
    
    
    
    //--------------- MIQ Annotation -------------------//
    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = MIQ_LATITUDE;
    coordinate.longitude = MIQ_LONGITUDE;
    
    MapAnnotation *annotationMIQ = [[MapAnnotation alloc]initWithLocation:coordinate];
    annotationMIQ.title = @"Museo Interactivo del Quijote";
    [self.mapView addAnnotation:annotationMIQ];

    [self.mapView selectAnnotation:(id <MKAnnotation>)annotationMIQ animated:NO];
    
    
    //--------------- Disable swipe to back navigation gesture -------------------//
    
    /*
     
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
     
     */
    
}




-(void) viewWillAppear:(BOOL)animated
{
    //------ Change Navigation Bar Background ------//
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];

}




//--------------- Code to display Callout Permanentley ---------------//
/*
 
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MapAnnotationView *)view
{
    [mapView selectAnnotation:view.annotation animated:FALSE];
    
}
*/





//--------------- Configure the Annotation View ---------------//



- (MapAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    
    //--------------- Annotation View ---------------//
        
    
        
    MapAnnotationView *annotationView = (MapAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    
    //--------------- Annotation View Initialization ---------------//
    if (annotationView == nil) {
                
        
        annotationView = [[MapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"pin_mapa"];
            
            
            
            
            
        //---------------Annotation Callout Configuration---------------//
            
            
        // Right Button (Directions)
            
        UIImageView *carView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Driving"]];
        UIButton *blueView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44+30)];
        blueView.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:109.0f/255.0f blue:149.0f/255.0f alpha:1];
        [blueView addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
            
        carView.frame = CGRectMake(11, 14, carView.image.size.width, carView.image.size.height);
        [blueView addSubview:carView];
        
        annotationView.rightCalloutAccessoryView = blueView;

            
            
            
            
        // Left Accesory Image
            
        UIImage *logoMIQ = [UIImage imageNamed:@"miq_mapa"];
        UIImageView *imagenMIQ = [[UIImageView alloc] initWithImage:logoMIQ];
        
        // (ALIGN LOGO WITHING CALLOUT HERE)
        [imagenMIQ setFrame: CGRectMake(10, 0, 49, logoMIQ.size.height)];
        
        UIView *leftCAV = [[UIView alloc] initWithFrame:CGRectMake(0,0,logoMIQ.size.width,logoMIQ.size.height)];
        leftCAV.contentMode = UIViewContentModeScaleAspectFill;
        
        [leftCAV addSubview : imagenMIQ];
        
        
        imagenMIQ.contentMode = UIViewContentModeScaleAspectFill;
        imagenMIQ.clipsToBounds = NO;
            
            
        annotationView.leftCalloutAccessoryView = leftCAV;
        annotationView.leftCalloutAccessoryView.contentMode = UIViewContentModeScaleAspectFill;
        [annotationView.leftCalloutAccessoryView setFrame:CGRectMake(0, 0, 49, logoMIQ.size.height)];

            
    }
    
    return annotationView;
}
    








#pragma mark - Navigation Services

//---------- Start navigation with correct app ----------//
- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [self navMaps];
                    break;
                case 1:
                    [self navGMaps];
                    break;
                case 2:
                    [self navWaze];
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}








//-------- Action Sheet Navigation --------//
-(void)showActionSheet
{
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Selecciona aplicación:" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:
                            @"Maps",
                            @"Google Maps",
                            @"Waze",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    
}









//------ Waze ------//
- (void) navWaze
{
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:@"waze://?ll=21.014495,-101.252017&z=10&navigate=yes"]]) {
        
        // Waze is installed. Launch Waze and start navigation
        NSString *urlStr =
        [NSString stringWithFormat:@"waze://?ll=21.014495,-101.252017&z=10&navigate=yes"];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        
    } else {
        
        // Waze is not installed. Launch AppStore to install Waze app
        [[UIApplication sharedApplication] openURL:[NSURL
                                                    URLWithString:@"http://itunes.apple.com/us/app/id323229106"]];
    }
}


//------ Apple Maps ------//
- (void) navMaps
{
    NSString *appleMapUrlString = [NSString stringWithFormat:@"http://maps.apple.com/maps?saddr=%f,%f&daddr=21.014495,-101.252017&t=Standard", self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appleMapUrlString]];
    
}






//------ Google Maps ------//
- (void) navGMaps
{
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        
        
        NSString *googleMapUrlString = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=21.014495,-101.252017&zoom=14&views=traffic", self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude];
        
        
        
        
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:googleMapUrlString]];
    
    }
    else {
        [[UIApplication sharedApplication] openURL:[NSURL
                                                    URLWithString:@"https://itunes.apple.com/mx/app/google-maps/id585027354?mt=8"]];;
    }
    
}







#pragma mark -



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
