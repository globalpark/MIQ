//
//  MapAnnotation.m
//  MIQ
//
//  Created by Work Station on 7/21/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MapAnnotation.h"
#import "MapViewController.h"

#define MIQ_LATITUDE 21.014443
#define MIQ_LONGITUDE -101.251957



// ONLY THE DATA FOR THE ANNOTATION; NO VISUAL REPRESENTATION IMPLEMENTED HERE

@implementation MapAnnotation

@synthesize coordinate;



- (NSString *)title
{
    return @" ";
}

// optional
- (NSString *)subtitle
{
    return @" ";
}

/*
- (UIImageView *)image
{
    UIImage *img = [UIImage imageNamed:@"bar_foto"];
    UIImageView *imagen = [[UIImageView alloc] initWithImage:img];
    
    return imagen;
}
*/


- (id)initWithLocation:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
    

}







@end
