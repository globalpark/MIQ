//
//  AcercaDeViewController.m
//  MIQ
//
//  Created by Luis Kentzler on 8/8/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "AcercaDeViewController.h"

@interface AcercaDeViewController ()

@property (nonatomic, strong) NSArray *pageImagesHeaderSegm0;
@property (nonatomic, strong) NSMutableArray *pageViewsHeaderSegm0;

@property (nonatomic, strong) NSArray *pageImagesHeaderSegm1;
@property (nonatomic, strong) NSMutableArray *pageViewsHeaderSegm1;

@property (nonatomic, strong) NSArray *pageImagesHeaderSegm2;
@property (nonatomic, strong) NSMutableArray *pageViewsHeaderSegm2;

@property (nonatomic, strong) NSArray *pageImagesHeaderSegm3;
@property (nonatomic, strong) NSMutableArray *pageViewsHeaderSegm3;


@end

@implementation AcercaDeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //---- Title Setup ----//
    
    self.title = @"ACERCA DE";
    
    self.scrollView.delegate = self;
    
    
    
    //--------------- Disable swipe to back navigation gesture -------------------//
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    
    
    
    //---- Scroll View Header ----//
    
    
    // Page Control
    self.imageViewBar.frame = CGRectMake(0, 168, 320, 18);
    [self.imageViewBar setImage:[UIImage imageNamed:@"bar_foto"]];
    
    
    //Arrays of Images - Segment 0
    self.pageImagesHeaderSegm0 = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  nil];
    
    
    //Arrays of Images - Segment 1
    self.pageImagesHeaderSegm1 = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  nil];
    
    
    
    //Arrays of Images - Segment 2
    self.pageImagesHeaderSegm2 = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  nil];
    
    
    
    //Arrays of Images - Segment 3
    self.pageImagesHeaderSegm3 = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  nil];
    
    
    
    // Create the arrays that holds the Image Views
    
    self.pageViewsHeaderSegm0 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.pageImagesHeaderSegm0.count; ++i) {
        [self.pageViewsHeaderSegm0 addObject:[NSNull null]]; // Placeholder
    }
    
    self.pageViewsHeaderSegm1 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.pageImagesHeaderSegm1.count; ++i) {
        [self.pageViewsHeaderSegm1 addObject:[NSNull null]]; // Placeholder
    }
    
    self.pageViewsHeaderSegm2 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.pageImagesHeaderSegm2.count; ++i) {
        [self.pageViewsHeaderSegm2 addObject:[NSNull null]]; // Placeholder
    }
    
    
    self.pageViewsHeaderSegm3 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.pageImagesHeaderSegm3.count; ++i) {
        [self.pageViewsHeaderSegm3 addObject:[NSNull null]]; // Placeholder
    }
    
    
    
    
    
    //---- Initial Setup ----//
    
    NSInteger pageCount0 = self.pageImagesHeaderSegm0.count;
    
    self.pageControl.numberOfPages = pageCount0;
    
    
    if(self.pageControl.numberOfPages <= 1)
    {
        self.imageViewBar.hidden = YES;
        self.pageControl.hidden = YES;
    }
    else
    {
        self.imageViewBar.hidden = NO;
        self.pageControl.hidden = NO;
    }
    
    
    
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
 
    
    
    
    
    
    
    
    
    
    
    //------ View for the Buttons ------//
    
    UIView *viewBotones = [[UIView alloc]initWithFrame:CGRectMake(0, 234, 320, 221)];
    viewBotones.hidden = YES;
    viewBotones.tag = 500;
    
    
    
    //------ Buttons Segment 4 ------//
    
    
    // Button "¿Cómo llegar?"
    UIButton *botonComoLlegar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [botonComoLlegar addTarget:self
                        action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    
    botonComoLlegar.frame = CGRectMake(35.0, 24.0, 250.0, 35.0);
    
    [botonComoLlegar setTitle:@"¿Cómo llegar?" forState:UIControlStateNormal];
    
    botonComoLlegar.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1];
    botonComoLlegar.titleLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:12];
    
    [botonComoLlegar setTitleColor:[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1] forState:UIControlStateNormal];
    botonComoLlegar.tag = 501;
    
    
    
    // Button "Llámanos"
    UIButton *botonLlamar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [botonLlamar addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    
    botonLlamar.frame = CGRectMake(35.0, 68.0, 250.0, 35.0);
    
    [botonLlamar setTitle:@"Llámanos" forState:UIControlStateNormal];
    
    botonLlamar.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1];
    botonLlamar.titleLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:12];
    
    [botonLlamar setTitleColor:[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1] forState:UIControlStateNormal];
    botonLlamar.tag = 502;
    
    
    
    // Button "Envíanos un correo"
    UIButton *botonCorreo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [botonCorreo addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    
    botonCorreo.frame = CGRectMake(35.0, 112.0, 250.0, 35.0);
    
    [botonCorreo setTitle:@"Envíanos un correo" forState:UIControlStateNormal];
    
    botonCorreo.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1];
    botonCorreo.titleLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:12];
    
    [botonCorreo setTitleColor:[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1] forState:UIControlStateNormal];
    botonCorreo.tag = 503;
    
    
    
    // Button "Aviso de privacidad"
    UIButton *botonAviso = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [botonAviso addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    
    botonAviso.frame = CGRectMake(35.0, 171.0, 250.0, 29.0);
    
    [botonAviso setTitle:@"Revisa nuestro Aviso Legal y Política de Privacidad" forState:UIControlStateNormal];
    
    botonAviso.backgroundColor = [UIColor colorWithRed:2.0f/255.0f green:119.0f/255.0f blue:178.0f/255.0f alpha:1];
    botonAviso.titleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:10];
    
    [botonAviso setTitleColor:[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1] forState:UIControlStateNormal];
    botonAviso.tag = 504;
    
    
    
    
    [viewBotones addSubview:botonComoLlegar];
    [viewBotones addSubview:botonLlamar];
    [viewBotones addSubview:botonCorreo];
    [viewBotones addSubview:botonAviso];
    [self.view addSubview:viewBotones];
    
    
    
    
    
}



-(void)viewWillAppear:(BOOL)animated
{
    //---- Configuration for Navigation Bar ----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
    
    
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeaderSegm0.count, 130);
    
    [self loadVisiblePages];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void) buttonPressed:(UIButton*)sender
{
    
    
    
    
    switch(sender.tag)
    {
        case 501: [self performSegueWithIdentifier:@"menuToComoLlegar" sender:self];
            break;
            
        case 502:
        {
            // Perform Call to number 473-732-3376
            NSString *phoneNumber = @"473-732-3376";
            NSString *phoneURLString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
            NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
            [[UIApplication sharedApplication] openURL:phoneURL];
        }
            break;
            
            
        case 503:
        {
            // Send email to mquijote@guanajuato.com
            NSString *mail = @"mailto:mquijote@guanajuato.com?subject=Contacto%20de%20App!";
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString: mail]];
        }
            break;
            
            
    }
    
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
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
                texto1.frame = CGRectMake(5, 5, 310, 33);
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
                
                texto2.frame = CGRectMake(5, 23, 310, 33);
                texto2.text = description;
                texto2.numberOfLines = 0;
                texto2.lineBreakMode = NSLineBreakByWordWrapping;
                [texto2 sizeToFit];

                
            }

            break;
            
        case 2:
            if(indexPath.row == 0)
            {
                
                cell = [self.tableView dequeueReusableCellWithIdentifier:@"celda4"];
                cell.userInteractionEnabled = NO;
                
                if(!cell)
                {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celda4"];
                }
                
                
                UILabel *tituloCelda4 = (UILabel *)[cell.contentView viewWithTag:401];
                [tituloCelda4 setText: @"HORARIO:"];
                tituloCelda4.textColor = [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1];
                
                UILabel *texto2 = (UILabel *)[cell.contentView viewWithTag:402];
                NSString *description =
                @"Martes a sábado: 9:30 a 20:00 horas. \nDomingo: 12:00 a 19:00 horas.";
                
                texto2.text = description;
                texto2.numberOfLines = 0;
                texto2.lineBreakMode = NSLineBreakByWordWrapping;
                texto2.textColor = [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:143.0f/255.0f alpha:1];
                [texto2 sizeToFit];

                
                
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
                texto1.frame = CGRectMake(5, 5, 310, 33);
                texto1.text = description;
                texto1.numberOfLines = 0;
                texto1.lineBreakMode = NSLineBreakByWordWrapping;
                [texto1 sizeToFit];

            
            
            
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
                return 120;
            }
            else
                return 240;
            break;
            
        case 1:
            if(indexPath.row == 0)
            {
                return 65;
            }
            else if(indexPath.row == 1)
                return 142;
            else
                return 100;
            break;
            
        case 2:
            if(indexPath.row == 0)
            {
                return 65;
            }
            else
                return 240;
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
    
    
    
    // Cast the view
    UIView *vistaBtn = [self.view viewWithTag:500];
    
    
    
    
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    
    
    switch(sender.selectedSegmentIndex){
            
            
        case 0:
            
            [self.segmentedControl setImage:museoActive forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitas forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafe forSegmentAtIndex:2];
            [self.segmentedControl setImage:contacto forSegmentAtIndex:3];
            self.tableView.hidden = NO;
            
            self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeaderSegm0.count, 130);
            
            [self.scrollView setContentOffset:CGPointMake(0, 0)];
            
            
            //Pages indicator
            
            // Asign the pageCount
            NSInteger pageCount0 = self.pageImagesHeaderSegm0.count;
            
            self.pageControl.numberOfPages = pageCount0;
            
            
            if(self.pageControl.numberOfPages <= 1)
            {
                self.imageViewBar.hidden = YES;
                self.pageControl.hidden = YES;
            }
            else
            {
                self.imageViewBar.hidden = NO;
                self.pageControl.hidden = NO;
            }
            
            //Buttons view
            vistaBtn.hidden = YES;
            
            
            break;
            
        case 1:
            
            [self.segmentedControl setImage:museo forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitasActive forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafe forSegmentAtIndex:2];
            [self.segmentedControl setImage:contacto forSegmentAtIndex:3];
            self.tableView.hidden = NO;
            
            self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeaderSegm1.count, 130);
            [self.scrollView setContentOffset:CGPointMake(0, 0)];
            
            
            //Pages indicator
            
            // Asign the pageCount
            NSInteger pageCount1 = self.pageImagesHeaderSegm1.count;
            
            self.pageControl.numberOfPages = pageCount1;
            
            if(self.pageControl.numberOfPages <= 1)
            {
                self.imageViewBar.hidden = YES;
                self.pageControl.hidden = YES;
            }
            else
            {
                self.imageViewBar.hidden = NO;
                self.pageControl.hidden = NO;
            }
            
            
             //Buttons view
            vistaBtn.hidden = YES;
           
            break;
            
        case 2:
            
            [self.segmentedControl setImage:museo forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitas forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafeActive forSegmentAtIndex:2];
            [self.segmentedControl setImage:contacto forSegmentAtIndex:3];
            self.tableView.hidden = NO;
            
            self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeaderSegm2.count, 130);
            
             [self.scrollView setContentOffset:CGPointMake(0, 0)];
            
            //Pages indicator
            
            // Asign the pageCount
            NSInteger pageCount2 = self.pageImagesHeaderSegm2.count;
            
            self.pageControl.numberOfPages = pageCount2;

            if(self.pageControl.numberOfPages <= 1)
            {
                self.imageViewBar.hidden = YES;
                self.pageControl.hidden = YES;
            }
            else
            {
                self.imageViewBar.hidden = NO;
                self.pageControl.hidden = NO;
            }
            
             //Buttons view
            vistaBtn.hidden = YES;
            
            break;
            
        case 3:
            [self loadVisiblePages];
            [self.segmentedControl setImage:museo forSegmentAtIndex:0];
            [self.segmentedControl setImage:visitas forSegmentAtIndex:1];
            [self.segmentedControl setImage:cafe forSegmentAtIndex:2];
            [self.segmentedControl setImage:contactoActive forSegmentAtIndex:3];
            self.tableView.hidden = YES;
            
            self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeaderSegm3.count, 130);
            
            
             [self.scrollView setContentOffset:CGPointMake(0, 0)];
            
            NSInteger pageCount3 = self.pageImagesHeaderSegm3.count;
            
            if(pageCount3>2)
            {
                self.pageControl.numberOfPages = pageCount3;
            }
            
            
            if(self.pageControl.numberOfPages <= 1)
            {
                self.imageViewBar.hidden = YES;
                self.pageControl.hidden = YES;
            }
            else
            {
                self.imageViewBar.hidden = NO;
                self.pageControl.hidden = NO;
            }
             //Buttons view
            vistaBtn.hidden = NO;
            
            break;
    }
    
    
    
    //[self.tableView reloadInputViews];
    [self.tableView reloadData];
    [self loadVisiblePages];
}



//---- Loads initial Pages for Header ----//

- (void)loadPage:(NSInteger)page {
    switch(self.segmentedControl.selectedSegmentIndex){
        case 0:{
            if (page < 0 || page >= self.pageImagesHeaderSegm0.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
                // Create the page.
                CGRect frame = self.scrollView.bounds;
                frame.origin.x = frame.size.width * page;
                frame.origin.y = 0.0f;
        
                // Creates UIImageView and adds it to the scrollView.
                UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImagesHeaderSegm0 objectAtIndex:page]];
                newPageView.contentMode = UIViewContentModeScaleAspectFit;
                newPageView.frame = frame;
                [self.scrollView addSubview:newPageView];
        
                // Replaces old (empty) page with the new page created
                [self.pageViewsHeaderSegm0 replaceObjectAtIndex:page withObject:newPageView];
            
            break;
        }
            
        case 1:{
            if (page < 0 || page >= self.pageImagesHeaderSegm1.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
            
            
                
                // Create the page.
                CGRect frame = self.scrollView.bounds;
                frame.origin.x = frame.size.width * page;
                frame.origin.y = 0.0f;
                
                // Creates UIImageView and adds it to the scrollView.
                UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImagesHeaderSegm1 objectAtIndex:page]];
                newPageView.contentMode = UIViewContentModeScaleAspectFit;
                newPageView.frame = frame;
                [self.scrollView addSubview:newPageView];
                
                // Replaces old (empty) page with the new page created
                [self.pageViewsHeaderSegm1 replaceObjectAtIndex:page withObject:newPageView];
            
            break;
        }
            
        case 2:{
            if (page < 0 || page >= self.pageImagesHeaderSegm2.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
                
                // Create the page.
                CGRect frame = self.scrollView.bounds;
                frame.origin.x = frame.size.width * page;
                frame.origin.y = 0.0f;
                
                // Creates UIImageView and adds it to the scrollView.
                UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImagesHeaderSegm2 objectAtIndex:page]];
                newPageView.contentMode = UIViewContentModeScaleAspectFit;
                newPageView.frame = frame;
                [self.scrollView addSubview:newPageView];
                
                // Replaces old (empty) page with the new page created
                [self.pageViewsHeaderSegm2 replaceObjectAtIndex:page withObject:newPageView];
            
            break;
        }
            
        case 3:{
            if (page < 0 || page >= self.pageImagesHeaderSegm3.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
                
                // Create the page.
                CGRect frame = self.scrollView.bounds;
                frame.origin.x = frame.size.width * page;
                frame.origin.y = 0.0f;
                
                // Creates UIImageView and adds it to the scrollView.
                UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImagesHeaderSegm3 objectAtIndex:page]];
                newPageView.contentMode = UIViewContentModeScaleAspectFit;
                newPageView.frame = frame;
                [self.scrollView addSubview:newPageView];
                
                // Replaces old (empty) page with the new page created
                [self.pageViewsHeaderSegm3 replaceObjectAtIndex:page withObject:newPageView];
            
            break;
        }
    }
}


- (void)purgePage:(NSInteger)page {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:{
            if (page < 0 || page >= self.pageImagesHeaderSegm0.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
    
            // Remove a page from the scroll view and reset the container array
            UIView *pageView = [self.pageViewsHeaderSegm0 objectAtIndex:page];
            if ((NSNull*)pageView != [NSNull null]) {
                [pageView removeFromSuperview];
                [self.pageViewsHeaderSegm0 replaceObjectAtIndex:page withObject:[NSNull null]];
            }
            break;
        }
            
        case 1:{
            if (page < 0 || page >= self.pageImagesHeaderSegm1.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
            
            // Remove a page from the scroll view and reset the container array
            UIView *pageView = [self.pageViewsHeaderSegm1 objectAtIndex:page];
            if ((NSNull*)pageView != [NSNull null]) {
                [pageView removeFromSuperview];
                [self.pageViewsHeaderSegm1 replaceObjectAtIndex:page withObject:[NSNull null]];
            }
            break;
        }
            
        case 2:{
            if (page < 0 || page >= self.pageImagesHeaderSegm2.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
            
            // Remove a page from the scroll view and reset the container array
            UIView *pageView = [self.pageViewsHeaderSegm2 objectAtIndex:page];
            if ((NSNull*)pageView != [NSNull null]) {
                [pageView removeFromSuperview];
                [self.pageViewsHeaderSegm2 replaceObjectAtIndex:page withObject:[NSNull null]];
            }
            break;
        }
            
        case 3:{
            if (page < 0 || page >= self.pageImagesHeaderSegm3.count) {
                // If it's outside the range of what you have to display, then do nothing
                return;
            }
            
            // Remove a page from the scroll view and reset the container array
            UIView *pageView = [self.pageViewsHeaderSegm3 objectAtIndex:page];
            if ((NSNull*)pageView != [NSNull null]) {
                [pageView removeFromSuperview];
                [self.pageViewsHeaderSegm3 replaceObjectAtIndex:page withObject:[NSNull null]];
            }
            break;
        }
    }
}





- (void)loadVisiblePages
{
    switch(self.segmentedControl.selectedSegmentIndex){
        case 0:{
            // First, determine which page is currently visible
            CGFloat pageWidth = self.scrollView.frame.size.width;
            NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
            
            // Update the page control
            self.pageControl.currentPage = page;
            NSLog(@"The page is %ld", (long)page);
            
            
            // Work out which pages you want to load
            NSInteger firstPage = page - 1;
            NSInteger lastPage = page + 1;
            
            // Purge anything before the first page
            for (NSInteger i=0; i<firstPage; i++) {
                [self purgePage:i];
            }
            
            // Load pages in our range
            for (NSInteger i=firstPage; i<=lastPage; i++) {
                [self loadPage:i];
            }
            
            // Purge anything after the last page
            for (NSInteger i=lastPage+1; i<self.pageImagesHeaderSegm0.count; i++) {
                [self purgePage:i];
            }
            break;
        }
            
            
          
        case 1:{
            // First, determine which page is currently visible
            CGFloat pageWidth = self.scrollView.frame.size.width;
            NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
            
            // Update the page control
            self.pageControl.currentPage = page;
            
            // Work out which pages you want to load
            NSInteger firstPage = page - 1;
            NSInteger lastPage = page + 1;
            
            // Purge anything before the first page
            for (NSInteger i=0; i<firstPage; i++) {
                [self purgePage:i];
            }
            
            // Load pages in our range
            for (NSInteger i=firstPage; i<=lastPage; i++) {
                [self loadPage:i];
            }
            
            // Purge anything after the last page
            for (NSInteger i=lastPage+1; i<self.pageImagesHeaderSegm1.count; i++) {
                [self purgePage:i];
            }
            break;
        }
            
            
            
        case 2:{
            // First, determine which page is currently visible
            CGFloat pageWidth = self.scrollView.frame.size.width;
            NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
            
            // Update the page control
            self.pageControl.currentPage = page;
            
            // Work out which pages you want to load
            NSInteger firstPage = page - 1;
            NSInteger lastPage = page + 1;
            
            // Purge anything before the first page
            for (NSInteger i=0; i<firstPage; i++) {
                [self purgePage:i];
            }
            
            // Load pages in our range
            for (NSInteger i=firstPage; i<=lastPage; i++) {
                [self loadPage:i];
            }
            
            // Purge anything after the last page
            for (NSInteger i=lastPage+1; i<self.pageImagesHeaderSegm2.count; i++) {
                [self purgePage:i];
            }
            break;
        }
            
            
            
        case 3:{
            // First, determine which page is currently visible
            CGFloat pageWidth = self.scrollView.frame.size.width;
            NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
            
            // Update the page control
            self.pageControl.currentPage = page;
            
            // Work out which pages you want to load
            NSInteger firstPage = page - 1;
            NSInteger lastPage = page + 1;
            
            // Purge anything before the first page
            for (NSInteger i=0; i<firstPage; i++) {
                [self purgePage:i];
            }
            
            // Load pages in our range
            for (NSInteger i=firstPage; i<=lastPage; i++) {
                [self loadPage:i];
            }
            
            // Purge anything after the last page
            for (NSInteger i=lastPage+1; i<self.pageImagesHeaderSegm3.count; i++) {
                [self purgePage:i];
            }
            break;
        }
    }
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages that are now on screen
    [self loadVisiblePages];
    NSLog(@"Scrolled!");
    
    
    
    /*
    //---- Infinite scroll Header ----//
    switch(self.segmentedControl.selectedSegmentIndex){
        case 0:{
            if(self.pageImagesHeaderSegm0.count>1){
                if (self.scrollView.contentOffset.x == (self.pageImagesHeaderSegm0.count-1)*320)
                {
                    [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,480) animated:NO];
        
                }
                else if (self.scrollView.contentOffset.x == 0)
                {
                    // user is scrolling to the right from image 10 to image 1.
                    // reposition offset to show image 1 that is on the left in the scroll view
                    [self.scrollView scrollRectToVisible:CGRectMake(960,0,320,480) animated:NO];
    
                }
            }
            break;
        }
            
            
            
        case 1:{
            if(self.pageImagesHeaderSegm1.count>1){
                if (self.scrollView.contentOffset.x == (self.pageImagesHeaderSegm1.count-1)*320)
                {
                    [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,480) animated:NO];
                }
                else if (self.scrollView.contentOffset.x == 0)
                {
                    // user is scrolling to the right from image 10 to image 1.
                    // reposition offset to show image 1 that is on the left in the scroll view
                    [self.scrollView scrollRectToVisible:CGRectMake(960,0,320,480) animated:NO];
                
                }
            }
            break;
        }
            
     
        case 2:{
            if(self.pageImagesHeaderSegm2.count>1){
                if (self.scrollView.contentOffset.x == (self.pageImagesHeaderSegm2.count-1)*320)
                {
                    [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,480) animated:NO];
                
                }
                else if (self.scrollView.contentOffset.x == 0)
                {
                    // user is scrolling to the right from image 10 to image 1.
                    // reposition offset to show image 1 that is on the left in the scroll view
                    [self.scrollView scrollRectToVisible:CGRectMake(960,0,320,480) animated:NO];
                }
            }
            break;
        }
            
            
        case 3:{
            if(self.pageImagesHeaderSegm3.count>1){
                if (self.scrollView.contentOffset.x == (self.pageImagesHeaderSegm3.count-1)*320)
                {
                    [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,480) animated:NO];
                }
                else if (self.scrollView.contentOffset.x == 0)
                {
                    // user is scrolling to the right from image 10 to image 1.
                    // reposition offset to show image 1 that is on the left in the scroll view
                    [self.scrollView scrollRectToVisible:CGRectMake(960,0,320,480) animated:NO];
                }
            }
            break;
        }
    }
     */
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
