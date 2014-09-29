//
//  EventoDetailViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 9/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "EventoDetailViewController.h"

@interface EventoDetailViewController ()

@end

@implementation EventoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) viewWillAppear:(BOOL)animated{
    self.tituloLabel.text = [self.eventoPFObject objectForKey:@"titulo"];
    self.artistaLabel.text = [self.eventoPFObject objectForKey:@"artista"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
