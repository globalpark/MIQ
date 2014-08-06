//
//  MenuTableViewController.m
//  MIQ
//
//  Created by Diego Morrison on 04/08/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController




-(void)viewWillAppear:(BOOL)animated
{
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarCON"] forBarMetrics:UIBarMetricsDefault];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-35.0f, 0.0f, 0.0f, 0.0);
    
    self.title = @"MENÚ";
    
    //Change Title's font and color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIFont fontWithName:@"AvenirNext-Medium" size:14],
                                                                     NSFontAttributeName,
                                                                     [UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1],
                                                                     NSForegroundColorAttributeName,
                                                                     nil]];
    
    UIImageView *fondo = [[UIImageView alloc] init];
    [fondo setFrame:self.tableView.frame];
    UIImage *fondo_menu= [UIImage imageNamed:@"fondo"];
    [fondo setImage:fondo_menu];
    
    self.tableView.backgroundView = fondo;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *icono = [[UIImageView alloc]initWithFrame:CGRectMake(22, 9, 25, 25)];
    int path = indexPath.row;
    
    //---- Ícono ----//
    
    UIImage *icono_acerca = [UIImage imageNamed:@"icono_acerca"];
    UIImage *icono_favoritos= [UIImage imageNamed:@"icono_favoritos"];
    UIImage *icono_gto= [UIImage imageNamed:@"icono_gto"];
    UIImage *icono_facebook= [UIImage imageNamed:@"icono_facebook"];
    UIImage *icono_coloquio= [UIImage imageNamed:@"icono_coloquio"];
    UIImage *icono_web= [UIImage imageNamed:@"icono_web"];
    UIImage *icono_twitter= [UIImage imageNamed:@"icono_twitter"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(55, 12, 160, 20)];
    
    
    
    //---- Label ----//
    
    label.font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
    NSString *lbl_favoritos = @"FAVORITOS";
    NSString *lbl_acerca = @"ACERCA DE MIQ";
    NSString *lbl_coloquio = @"COLOQUIO CERVANTINO";
    NSString *lbl_MAS = @"MÁS DE GUANAJUATO";
    NSString *lbl_web = @"WEB OFICIAL";
    NSString *lbl_facebook = @"FACEBOOK";
    NSString *lbl_twitter = @"TWITTER";
    
    
    
    [cell.contentView addSubview:icono];
    [cell.contentView addSubview:label];
    
    
    
    
    switch (path) {
            
            //ACERCA DE MIQ
        case 0:
            [icono setImage:icono_acerca];
            label.text = lbl_acerca;
            break;
            
            //FAVORITOS
        case 1:
            [icono setImage:icono_favoritos];
            label.text = lbl_favoritos;
            break;
            
            //COLOQUIO CERVANTINO
        case 2:
            [icono setImage:icono_coloquio];
            label.text = lbl_coloquio;
            break;
            
            //MÁS DE GUANAJUATO
        case 3:
            [icono setImage:icono_gto];
            label.text = lbl_MAS;
            break;
            
            //WEB OFICIAL
        case 4:
            [icono setImage:icono_web];
            label.text = lbl_web;
            break;
            
            //FACEBOOK
        case 5:
            [icono setImage:icono_facebook];
            label.text = lbl_facebook;
            break;
            
            //TWITTER
        case 6:
            [icono setImage:icono_twitter];
            label.text = lbl_twitter;
            break;
            
        default:
            break;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int celda_seleccionada = indexPath.row;
    
    switch (celda_seleccionada) {
        case 0:
            [self performSegueWithIdentifier:@"menuToAcercaDe" sender:self];
            break;
            
        case 1:
            [self performSegueWithIdentifier:@"menuToFav" sender:self];
            break;
            
        case 2:
            [self performSegueWithIdentifier:@"menuToColoquio" sender:self];
            break;
            
        case 3:
            [self performSegueWithIdentifier:@"menuToGTO" sender:self];
            break;
            
        case 4:
            // Open Web Page in Safari
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.guanajuato.gob.mx/museo/"]];
            break;
            
        case 5:
            // Open Facebook App
            if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]])
            {
                // GET ID HERE: https://graph.facebook.com/kentzler
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/1549014102"]];
            }
            break;
            
        case 6:
            // Open Twitter App
            if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]])
            {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=MuseoQuijoteGto"]];
            }
            break;
            
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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

@end
