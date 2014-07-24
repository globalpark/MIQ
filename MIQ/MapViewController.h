//
//  MapViewController.h
//  MIQ
//
//  Created by Work Station on 7/21/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, UIActionSheetDelegate,CLLocationManagerDelegate>{
    
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
