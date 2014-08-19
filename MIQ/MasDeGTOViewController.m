//
//  MasDeGTOViewController.m
//  MIQ
//
//  Created by Luis Kentzler on 8/18/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MasDeGTOViewController.h"

@interface MasDeGTOViewController ()

@end

@implementation MasDeGTOViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //---- Title Setup ----//
    
    self.title = @"MÁS DE GUANAJUATO";
    
    self.tableView.delegate = self;
    
    
    //--------------- Disable swipe to back navigation gesture -------------------//
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    //---- Configuration for Navigation Bar ----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
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
        NSLog(@"Celda 1 check");
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda1"];
        cell.userInteractionEnabled = NO;
        
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda1"];
        }
        
        UIImageView *imagenIzq = (UIImageView *)[cell.contentView viewWithTag:11];
        UIImageView *imagenDer = (UIImageView *)[cell.contentView viewWithTag:12];
        
        [imagenDer setImage:[UIImage imageNamed:@"logoIMPULSOmas"]];
        [imagenIzq setImage:[UIImage imageNamed:@"logoGTOmas"]];
        
        
        
    }
    
    
    
    if(indexPath.row == 1){
        NSLog(@"Celda 2 check");
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda2"];
        cell.userInteractionEnabled = NO;
        
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda2"];
        }
        
        
        
        UILabel *tituloPrincipal = (UILabel *)[cell.contentView viewWithTag:100];
        tituloPrincipal.text = @"ENLACES INSTITUCIONALES";
        
        UILabel *titulo1 = (UILabel *)[cell.contentView viewWithTag:201];
        UILabel *subTitulo1 = (UILabel *)[cell.contentView viewWithTag:202];
        titulo1.text = @"Gobierno del Estado de Guanajuato";
        subTitulo1.text=@"www.guanajuato.gob.mx";
        
        
        UILabel *titulo2 = (UILabel *)[cell.contentView viewWithTag:301];
        UILabel *subTitulo2 = (UILabel *)[cell.contentView viewWithTag:302];
        titulo2.text=@"Universidad de Guanajuato";
        subTitulo2.text=@"www.ugto.mx";
        
        UILabel *titulo3 = (UILabel *)[cell.contentView viewWithTag:401];
        UILabel *subTitulo3 = (UILabel *)[cell.contentView viewWithTag:402];
        titulo3.text=@"Presidencia Municipal de Guanajuato";
        subTitulo3.text=@"www.guanajuatocapital.mx";
        
        UILabel *titulo4 = (UILabel *)[cell.contentView viewWithTag:501];
        UILabel *subTitulo4 = (UILabel *)[cell.contentView viewWithTag:502];
        titulo4.text=@"Secretaría de Educación de Guanajuato";
        subTitulo4.text=@"www.seg.guanajuato.gob.mx";
        
    }
    
    
    
    
    return cell;
    
}









- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(indexPath.row == 0)
    {
        return 75;
    }
    else
        return 235;
    
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
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
