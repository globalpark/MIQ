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
    
    //---- Title Setup ----//
    self.title = @"ACERCA DE";
    
    
    //---- Images Buttons ----//
    UIImage *museo = [[UIImage imageNamed:@"museo_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *visitas = [[UIImage imageNamed:@"visitas"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *cafe = [[UIImage imageNamed:@"cafe"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *contacto = [[UIImage imageNamed:@"contacto"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    //-------- Array --------//
    
    NSArray *itemArray = [NSArray arrayWithObjects: museo,visitas,cafe,contacto, nil];
    
    //-------- Segmented Control --------//
    
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:itemArray];
    [self.segmentedControl setFrame:CGRectMake(0, 186, 320, 48)];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.tintColor = [UIColor clearColor];
    [self.segmentedControl addTarget:self
                         action:@selector(segmentAction:)
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
    UIImage *selectedBackgroundImage = [UIImage imageNamed:@"background_deselected"];
    [self.segmentedControl setBackgroundImage:selectedBackgroundImage
                                forState:UIControlStateSelected
                              barMetrics:UIBarMetricsDefault];
    
    
    
    
    
    
    
    
    
    
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

    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 2;
            break;
        default:
            return 1;
    }
}

/*
-(UITableViewCell *) updateTableView
{
    
    
}
 
*/




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    

    
    switch(self.segmentedControl.selectedSegmentIndex){
            
            
            
        case 0:
            
            if(indexPath.row == 0)
            {
                
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda1"];
                cell.userInteractionEnabled = NO;
                
                
                if(!cell){
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda1"];
                }
                
                UILabel *tituloHorarioLabel = (UILabel *)[cell.contentView viewWithTag:1];
                tituloHorarioLabel.text = @"HORARIO DE VISITA:";
                
                UILabel *horarioLabel = (UILabel *)[cell.contentView viewWithTag:2];
                horarioLabel.text = @"Martes a sábado: 9:30 a 18:45";
                
                UILabel *tituloAdmisionLabel = (UILabel *)[cell.contentView viewWithTag:3];
                tituloAdmisionLabel.text = @"ADMISIÓN:";
                
                UILabel *entradaLabel = (UILabel *)[cell.contentView viewWithTag:4];
                entradaLabel.text = @"Entrada general: $300";
                
                UILabel *menoresLabel = (UILabel *)[cell.contentView viewWithTag:5];
                menoresLabel.text = @"Menores de 13 años, estudiantes e INAPAM: $10.00";
                
                UILabel *asteriscoLabel = (UILabel *)[cell.contentView viewWithTag:6];
                asteriscoLabel.text = @"*Martes: Entrada Gratuita";
                
                
            }
            
            if(indexPath.row == 1)
            {
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda2"];
                cell.userInteractionEnabled = NO;
                if(!cell)
                {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda2"];
                
                }
                
                UILabel *texto1 = (UILabel *)[cell.contentView viewWithTag:7];
                NSString *description =
                @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam placerat ac nibh volutpat accumsan. Nunc eget massa eu tellus sagittis pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam placerat ac nibh volutpat accumsan. Nunc eget massa eu tellus sagittis. \n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam placerat ac nibh volutpat accumsan. Nunc eget massa eu tellus sagittis pharetra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam placerat ac nibh volutpat accumsan. Nunc eget massa eu tellus sagittis.";
                
                texto1.text = description;
                texto1.numberOfLines = 0;
                texto1.lineBreakMode = NSLineBreakByWordWrapping;
                [texto1 sizeToFit];
                
            }
            
            
            break;
            
        case 1:
            
            if(indexPath.row == 0)
            {
                
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda3"];
                cell.userInteractionEnabled = NO;
                
                if(!cell){
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda3"];
                }
                
                
                UILabel *tituloCelda3 = (UILabel *)[cell.contentView viewWithTag:8];
                [tituloCelda3 setText: @"¡PLANEA TU VISITA! CONTÁCTANOS:"];
                
                UILabel *mailLabel = (UILabel *)[cell viewWithTag:9];
                mailLabel.text = @"mquijote@guanajuato.com";
                
                UILabel *telefonoLabel = (UILabel *)[cell viewWithTag:10];
                telefonoLabel.text = @"473-732-3376";
            }
            
            if(indexPath.row == 1)
            {
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda2"];
                cell.userInteractionEnabled = NO;
        
                if(!cell)
                {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda2"];
                }
                
                
                
                UILabel *texto1 = (UILabel *)[cell.contentView viewWithTag:7];
                NSString *description =
                @"De manera permanente, el MIQ te ofrece el servicio de visitas guiadas. Con la asistencia de nuestros guías, podrás apreciar e interpretar la obra pictórica, escultórica y artesanal en torno al Caballero de la Triste Figura, exhibida en 16 salas, la Capilla Cervantina y el Patio de las Esculturas de este magnífico inmueble.";
                
                texto1.text = description;
                texto1.numberOfLines = 0;
                texto1.lineBreakMode = NSLineBreakByWordWrapping;
                [texto1 sizeToFit];
                
                
                
            }
            
            
            
            if(indexPath.row == 2)
            {
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda4"];
                cell.userInteractionEnabled = NO;
                
                if(!cell)
                {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda4"];
                }
                
                
                UILabel *tituloCelda4 = (UILabel *)[cell.contentView viewWithTag:401];
                [tituloCelda4 setText: @"REQUISITOS:"];
                
                UILabel *texto2 = (UILabel *)[cell.contentView viewWithTag:402];
                NSString *description =
                @"- La solicitud debe hacerse con 3 días hábiles de anticipación para programar tu visita.\n - El uso de guía no tiene costo extra. \n- Grupos de 30 personas como máximo.";
                
                texto2.text = description;
                texto2.numberOfLines = 0;
                texto2.lineBreakMode = NSLineBreakByWordWrapping;
                [texto2 sizeToFit];

                
            }

            break;
            
        case 2:
            if(indexPath.row == 0)
            {
                
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda5"];
                cell.userInteractionEnabled = NO;
                
                if(!cell){
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda5"];
                    
                    UILabel *tituloLabel = (UILabel *)[cell viewWithTag:1];
                    tituloLabel.text = @"HOLA";
                    
                    UILabel *horarioLabel = (UILabel *)[cell viewWithTag:1];
                    horarioLabel.text = @"Martes a sábado: 9:30 a 18:45";
                }
                
            }
            
            if(indexPath.row == 1)
            {
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda2"];
                cell.userInteractionEnabled = NO;
        
                if(!cell)
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda2"];
            }
            break;
            

            
        case 3:
            if(indexPath.row == 0)
            {
                
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda1"];
                cell.userInteractionEnabled = NO;
                
                if(!cell){
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda1"];
                    
                    UILabel *tituloLabel = (UILabel *)[cell viewWithTag:1];
                    tituloLabel.text = @"HOLA";
                    
                    UILabel *horarioLabel = (UILabel *)[cell viewWithTag:1];
                    horarioLabel.text = @"Martes a sábado: 9:30 a 18:45";
                }
                
            }
            
            if(indexPath.row == 1)
            {
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda2"];
                cell.userInteractionEnabled = NO;
                
                if(!cell)
                {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda2"];
                }
            }
            break;
            

    }
    
    
    
    
    return cell;

}









- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            if(indexPath.row == 0)
            {
                return 110;
            }
            else
                return 160;
            break;
            
        case 1:
            if(indexPath.row == 0)
            {
                return 60;
            }
            else if(indexPath.row == 1)
                return 80;
            else
                return 100;
            break;
            
        case 2:
            if(indexPath.row == 0)
            {
                return 100;
            }
            else
                return 250;
            break;
        default:
            return 300;
            break;
    }
}






-(void)segmentAction:(UISegmentedControl*)sender {
    
    
    //---- Images Non-active ----//
    
    UIImage *museo = [[UIImage imageNamed:@"museo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *visitas = [[UIImage imageNamed:@"visitas"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *cafe = [[UIImage imageNamed:@"cafe"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *contacto = [[UIImage imageNamed:@"contacto"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //---- Images Active ----//
    UIImage *museoActive = [[UIImage imageNamed:@"museo_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *visitasActive = [[UIImage imageNamed:@"visitas_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
     UIImage *cafeActive = [[UIImage imageNamed:@"cafe_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UIImage *contactoActive = [[UIImage imageNamed:@"contacto_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    switch(sender.selectedSegmentIndex){
            
        case 0:
            [self.segmentedControl setImage:museoActive forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitas forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafe forSegmentAtIndex:2];
            [self.segmentedControl setImage:contacto forSegmentAtIndex:3];
            
            
            
            
        break;
            
        case 1:
            [self.segmentedControl setImage:museo forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitasActive forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafe forSegmentAtIndex:2];
            [self.segmentedControl setImage:contacto forSegmentAtIndex:3];
            
            
            self.imageViewBar.hidden = YES;
        break;
            
        case 2:
            [self.segmentedControl setImage:museo forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitas forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafeActive forSegmentAtIndex:2];
            [self.segmentedControl setImage:contacto forSegmentAtIndex:3];
            
            break;
            
        case 3:
            [self.segmentedControl setImage:museo forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitas forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafe forSegmentAtIndex:2];
            [self.segmentedControl setImage:contactoActive forSegmentAtIndex:3];
            break;
    }
    
    
    
    //[self.tableView reloadInputViews];
    [self.tableView reloadData];
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
