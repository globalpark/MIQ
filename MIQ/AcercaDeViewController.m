//
//  AcercaDeViewController.m
//  MIQ
//
//  Created by Luis Kentzler on 8/8/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "AcercaDeViewController.h"

@interface AcercaDeViewController ()

@end

@implementation AcercaDeViewController

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
    
    
    //---- Images Buttons ----//
    UIImage *museo = [[UIImage imageNamed:@"museo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *visitas = [[UIImage imageNamed:@"visitas"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *cafe = [[UIImage imageNamed:@"cafe"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *contacto = [[UIImage imageNamed:@"contacto"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //-------- Array --------//
    
    NSArray *itemArray = [NSArray arrayWithObjects: museo,visitas,cafe,contacto, nil];
    
    //-------- Segmented Control --------//
    
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:itemArray];
    [self.segmentedControl setFrame:CGRectMake(0, 186, 320, 35)];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self
                         action:@selector(btnSeleccionado)
               forControlEvents:UIControlEventValueChanged];
    
    // Set divider images
    [self.segmentedControl setDividerImage:[UIImage imageNamed:@"corner_selected"]
                  forLeftSegmentState:UIControlStateNormal
                    rightSegmentState:UIControlStateNormal
                           barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setDividerImage:[UIImage imageNamed:@"corner_selected"]
                  forLeftSegmentState:UIControlStateSelected
                    rightSegmentState:UIControlStateNormal
                           barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setDividerImage:[UIImage imageNamed:@"corner_selected"]
                  forLeftSegmentState:UIControlStateNormal
                    rightSegmentState:UIControlStateSelected
                           barMetrics:UIBarMetricsDefault];
    
    // Set background images
    UIImage *normalBackgroundImage = [UIImage imageNamed:@"background_deselected"];
    [self.segmentedControl setBackgroundImage:normalBackgroundImage
                                forState:UIControlStateNormal
                              barMetrics:UIBarMetricsDefault];
    UIImage *selectedBackgroundImage = [UIImage imageNamed:@"background_selectedDark"];
    [self.segmentedControl setBackgroundImage:selectedBackgroundImage
                                forState:UIControlStateSelected
                              barMetrics:UIBarMetricsDefault];
    
    
    // Adjust text
    [self.segmentedControl setContentPositionAdjustment:UIOffsetMake(0, 2) forSegmentType: UISegmentedControlSegmentLeft barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setContentPositionAdjustment:UIOffsetMake(0, 2) forSegmentType: UISegmentedControlSegmentRight barMetrics:UIBarMetricsDefault];
    
    
    
    
    
    
    
    [self.view addSubview:self.segmentedControl];
    
    
    
    
    // Atributes for normal button
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont fontWithName:@"AvenirNext-Regular" size:12],
                                NSFontAttributeName,
                                [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1],
                                NSForegroundColorAttributeName,
                                nil];
    
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    
    
    
    // Atributes for highlighted button
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIFont fontWithName:@"AvenirNext-Demibold" size:12],
                                           NSFontAttributeName,
                                           [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1],
                                           NSForegroundColorAttributeName,
                                           nil];
    
    [self.segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateSelected];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celda1" forIndexPath:indexPath];
    
    return cell;
}



-(void)btnSeleccionado
{

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
