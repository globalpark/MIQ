//
//  MapAnnotation.h
//  MIQ
//
//  Created by Work Station on 7/21/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MapAnnotationView.h"

@interface MapAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
}


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


-(id)initWithLocation:(CLLocationCoordinate2D)coordinate;
@end
