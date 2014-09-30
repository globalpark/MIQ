//
//  EventoDayViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 9/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "EventoDayViewController.h"
#import "EventoDetailViewController.h"
#import <Parse/Parse.h>

@interface EventoDayViewController ()

-(NSInteger)diaEventoToInt:(NSString *)dia;

@end

@implementation EventoDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
    
    self.title = self.diaEvento;
    
    self.dayTitleLabel.text = self.diaEvento;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Evento"];
    
    if (![self.diaEvento  isEqual: @"Todos"]) {
        [query whereKey:@"diaSemana" equalTo:self.diaEvento];
    }else{
        self.dayTitleLabel.text = @"Próximos Eventos";
        self.title = @"Próximos Eventos";
    }
    
    NSInteger numeroDiaEvento = [self diaEventoToInt:self.diaEvento];
    
    switch (numeroDiaEvento) {
        case 1:
            self.diaImageView.image = [UIImage imageNamed:@"evento_detalle_cine"];
            break;
        default:
            self.diaImageView.image = [UIImage imageNamed:@"img_eventos01"];
            break;
    }
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error){
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }else{
            self.eventos = objects;
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.eventos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellEvento" forIndexPath:indexPath];
    
    PFObject *eventoParse = [self.eventos objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [eventoParse objectForKey:@"titulo"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[self performSegueWithIdentifier:@"dayToDetail" sender:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"dayToDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [segue.destinationViewController setEventoPFObject:[self.eventos objectAtIndex:indexPath.row]];
    }else{
        NSLog(@"NO");
    }
}

-(NSInteger *) diaEventoToInt:(NSString *)dia{
    if([dia isEqualToString:@"Lunes"]){
        return 1;
    }else if([dia isEqualToString:@"Martes"]){
        return 2;
    }else if([dia isEqualToString:@"Miércoles"]){
        return 3;
    }else if([dia isEqualToString:@"Jueves"]){
        return 4;
    }else if([dia isEqualToString:@"Viernes"]){
        return 5;
    }else{
        return 0;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
