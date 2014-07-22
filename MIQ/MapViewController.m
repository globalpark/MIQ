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
    
    
    //----------------------------------------------------//
    
    // MIQ Annotation
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = MIQ_LATITUDE;
    coordinate.longitude = MIQ_LONGITUDE;
    
    MapAnnotation *annotationMIQ = [[MapAnnotation alloc]initWithLocation:coordinate];
    annotationMIQ.title = @"Museo Interactivo del Quijote";
    [self.mapView addAnnotation:annotationMIQ];
    
}








- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    
        
        
        // Configure the annotationView and add custom image
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"pin_mapa"];
            annotationView.canShowCallout = YES;
            
            
            
            
            
            //-------------------------------------------------//
            
            // CUSTOM CALLOUT
            
            
            // Right Button (Directions)
            
            
            UIImageView *carView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Driving"]];
            UIButton *blueView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44+30)];
            blueView.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:109.0f/255.0f blue:149.0f/255.0f alpha:1];
            [blueView addTarget:carView action:@selector(selector) forControlEvents:UIControlEventTouchUpInside];
            
            carView.frame = CGRectMake(11, 14, carView.image.size.width, carView.image.size.height);
            [blueView addSubview:carView];
            
            annotationView.rightCalloutAccessoryView = blueView;

            
            
            
            
            
            
            
            
            
            // Image and two labels
            
            
            
            
            UIImage *logoMIQ = [UIImage imageNamed:@"miq_mapa"];
            
            
            UIImageView *imagenMIQ = [[UIImageView alloc] initWithImage:logoMIQ];
            
            
            [imagenMIQ setFrame: CGRectMake(-3, 0, 49, logoMIQ.size.height)];
            
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
    










-(void)mapView: (MKMapView*)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    
    
}








#pragma mark - Navigation Services
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












- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





// Add functionality when the callout is tapped
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
    [self navWaze];
}

/*

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
    MapAnnotation *Annotation = (MapAnnotation *)view.annotation;
    [self.mapView deselectAnnotation:Annotation animated:YES];
    
    NSString *mensaje = [@"¿Cómo llegar? " stringByAppendingFormat:@"\n latitud %f \n longitud %f", Annotation.coordinate.latitude, Annotation.coordinate.longitude];
    UIAlertView *alerta = [[UIAlertView alloc]
                           initWithTitle:@"localización"
                           message:mensaje
                           delegate:self
                           cancelButtonTitle:@"OK"
                           otherButtonTitles: nil];
    [alerta show];
    
}




*/


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
