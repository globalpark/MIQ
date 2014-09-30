//
//  EventoFavoritosViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 9/29/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "EventoFavoritosViewController.h"
#import "EventoDetailViewController.h"

@interface EventoFavoritosViewController ()

@end

@implementation EventoFavoritosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    PFRelation *favoritosPFRelation = [[PFUser currentUser] objectForKey:@"favorito"];
    PFQuery *query = [favoritosPFRelation query];
    [query  findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }else{
            self.favoritos = objects;
            [self.tableView reloadData];
        }
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.favoritos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellFavorito" forIndexPath:indexPath];
    
    PFObject *eventoParse = [self.favoritos objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [eventoParse objectForKey:@"titulo"];
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"favoritoToDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [segue.destinationViewController setEventoPFObject:[self.favoritos objectAtIndex:indexPath.row]];
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
