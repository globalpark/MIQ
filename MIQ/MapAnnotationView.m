//
//  MapAnnotationView.m
//  MIQ
//
//  Created by Work Station on 7/21/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MapAnnotationView.h"
#import "MapAnnotation.h"


//VISUAL REPRESENTATION OF THE PINS

@implementation MapAnnotationView
/*
- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
   
}
*/



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if(selected)
    {


        
    }
    else
    {
        [self setSelected:YES];
    }
}


/*
- (NSString *)title
{
    return @"Museo Interactivo del Quijote";
}
*/

@end
