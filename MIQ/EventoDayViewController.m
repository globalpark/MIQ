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

@end

@implementation EventoDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
    
    self.dayTitleLabel.text = self.diaEvento;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Evento"];
    if (![self.diaEvento  isEqual: @"Todos"]) {
        [query whereKey:@"diaSemana" equalTo:self.diaEvento];
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
    [self performSegueWithIdentifier:@"dayToDetail" sender:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"dayToDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [segue.destinationViewController setEventoPFObject:[self.eventos objectAtIndex:indexPath.row]];
    }else{
        NSLog(@"NO");
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
