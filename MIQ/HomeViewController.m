//
//  HomeViewController.m
//  MIQ
//
//  Created by Work Station on 7/9/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    
    //Change status bar to Light theme
    [self setNeedsStatusBarAppearanceUpdate];
    
#pragma mark - Low screen Buttons
    
//Create button for Coloquio Cervantino
    
    UIButton *cervantinoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cervantinoButton.frame = CGRectMake(5, 408, 100, 100);
    [cervantinoButton setImage:[UIImage imageNamed:@"coloquio_home"] forState:UIControlStateNormal];
    cervantinoButton.adjustsImageWhenHighlighted = YES;
    cervantinoButton.tag = 1;
    
    
    [cervantinoButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cervantinoButton];
    
    
    
    
    
//Create button for Calendario de Eventos
    
    
    UIButton *calendarioButton = [UIButton buttonWithType:UIButtonTypeCustom];
    calendarioButton.frame = CGRectMake(110, 408, 100, 100);
    [calendarioButton setImage:[UIImage imageNamed:@"calendario_home"] forState:UIControlStateNormal];
    calendarioButton.adjustsImageWhenHighlighted = YES;
    calendarioButton.tag = 2;
    
    [calendarioButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
     
    [self.view addSubview:calendarioButton];
    
    
    
    
//Create button for ¿Cómo llegar?
    
    UIButton *comoLlegarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    comoLlegarButton.frame = CGRectMake(215, 408, 100, 100);
    [comoLlegarButton setImage:[UIImage imageNamed:@"llegar"] forState:UIControlStateNormal];
    comoLlegarButton.adjustsImageWhenHighlighted = YES;
    comoLlegarButton.tag = 3;
    
    [comoLlegarButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:comoLlegarButton];
    
    
    
    

    
    

    
}

-(void) performSegue:(UIButton*)sender
{
    
    switch(sender.tag)
    {
        case 1: [self performSegueWithIdentifier:@"homeToColoquio" sender:self];
        break;
            
        case 2: [self performSegueWithIdentifier:@"homeToCalendario" sender:self];
        break;
        
        case 3: [self performSegueWithIdentifier:@"homeToComoLlegar" sender:self];
        break;
            
            
    }
    
    /*
    // Segue to Coloquio Cervantino
    if([sender tag] == 1){
        [self performSegueWithIdentifier:@"homeToComoLlegar" sender:self];
        
    }
    
    //Segue for Calendario Eventos
    if([sender tag] == 2){
        [self performSegueWithIdentifier:@"SegueIdentifier" sender:self];
        
    }
    
    // Segue for ¿Cómo llegar?
    if([sender tag] == 3){
        [self performSegueWithIdentifier:@"SegueIdentifier" sender:self];
        
    }
*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Setup

//Change status bar to Light theme
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
