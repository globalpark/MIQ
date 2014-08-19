//
//  ColoquioViewController.m
//  MIQ
//
//  Created by Luis Kentzler on 8/19/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "ColoquioViewController.h"

@interface ColoquioViewController ()

@end

@implementation ColoquioViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //---- Title Setup ----//
    
    self.title = @"COLOQUIO";
    
    self.tableView.delegate = self;
    
    
    //--------------- Disable swipe to back navigation gesture -------------------//
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}



-(void)viewWillAppear:(BOOL)animated
{
    
    //---- Configuration for Navigation Bar ----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
    
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
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    
    
    
    
    if(indexPath.row == 0){
        
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda1"];
        cell.userInteractionEnabled = YES;
        
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda1"];
        }
        
        UILabel *tituloColoquio = (UILabel *)[cell.contentView viewWithTag:700];
        tituloColoquio.text = @"XXIV COLOQUIO CERVANTINO INTERNACIONAL";

        UILabel *descripcionColoquio = (UILabel *)[cell.contentView viewWithTag:701];
        descripcionColoquio.text = @"Teatro y poesía serán los registros para la celebración del XXIV Coloquio: Cervantes dramaturgo y poeta";
        
    }
    
    
    
    if(indexPath.row == 1){
        
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda2"];
        cell.userInteractionEnabled = NO;
        
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda2"];
        }
        
        
        
        UILabel *cuerpoTexto = (UILabel *)[cell.contentView viewWithTag:801];
        cuerpoTexto.text = @"Los más destacados especialistas nacionales y extranjeros reflexionarán y revisitarán la totalidad de la obra cervantina aludida; y se presentará el tercer volumen de la Edición Guanajuato de las Obras Completas (OC) del alcalíno, coordinada por la autoridad del doctro Florencio Sevilla Arroyo, cuyo trabajo de exploración ecdótico y filológico respalda más de 30 años de sistemática investigación. Este libro complementa las respectivas publicaciones de los Coloquios XXI, XXII y XXIII: Don Quijote de la Mancha (OC, tomo I), ReTrato de Miguel de Cervantes Saavedra y La Galatea, Novelas ejemplares y Los trabajos de Persiles y Sigismunda (OC, tomo II)";
        cuerpoTexto.lineBreakMode = NSLineBreakByWordWrapping;
        [cuerpoTexto sizeToFit];
    }
    
    
    
    
    return cell;
    
}









- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(indexPath.row == 0)
    {
        return 70;
    }
    else
        return 235;
    
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
