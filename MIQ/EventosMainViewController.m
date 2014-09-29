//
//  EventosMainViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 9/24/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "EventosMainViewController.h"
#import "EventoDayViewController.h"

@interface EventosMainViewController ()

@property (nonatomic, strong) NSArray *pageImagesHeader;
@property (nonatomic, strong) NSMutableArray *pageViewsHeader;

@end

@implementation EventosMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //---- Title Setup ----//
    
    self.title = @"EVENTOS";
    
    
    self.scrollView.delegate = self;
    
    //--------------- Disable swipe to back navigation gesture -------------------//
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    
    //---- Scroll View Header ----//
    [self.imageViewBar setImage:[UIImage imageNamed:@"bar_foto"]];
    
    //Arrays of Images - Segment 0
    self.pageImagesHeader = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  [UIImage imageNamed:@"placeholder.gif"],
                                  nil];
    
    // Create the arrays that holds the Image Views
    
    self.pageViewsHeader = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.pageImagesHeader.count; ++i) {
        [self.pageViewsHeader addObject:[NSNull null]]; // Placeholder
    }
    
    //---- Initial Setup ----//
    
    NSInteger pageCount = self.pageImagesHeader.count;
    
    self.pageControl.numberOfPages = pageCount;
    
    
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
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    //---- Configuration for Navigation Bar ----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
    
    
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeader.count, 370);
    
    [self loadVisiblePages];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DayCell" forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 84)];
    UIImage *imagen;
    
    [cell.contentView addSubview:imageView];

    
    switch (indexPath.row) {
        case 0:
            imagen = [UIImage imageNamed:@"celda_lunes.png"];
            [imageView setImage:imagen];
            break;
            
        case 1:
            imagen = [UIImage imageNamed:@"celda_martes.png"];
            [imageView setImage:imagen];
            break;
            
        case 2:
            imagen = [UIImage imageNamed:@"celda_miercoles.png"];
            [imageView setImage:imagen];
            break;
            
        case 3:
            imagen = [UIImage imageNamed:@"celda_jueves.png"];
            [imageView setImage:imagen];
            break;
            
        case 4:
            imagen = [UIImage imageNamed:@"celda_viernes.png"];
            [imageView setImage:imagen];
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"dayToList" sender:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"dayToList"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        switch (indexPath.row) {
            case 0:
                self.diaEvento = @"Lunes";
                break;
            case 1:
                self.diaEvento = @"Martes";
                break;
            case 2:
                self.diaEvento = @"Miércoles";
                break;
            case 3:
                self.diaEvento = @"Jueves";
                break;
            case 4:
                self.diaEvento = @"Viernes";
                break;
            default:
                break;
        }
        
        [segue.destinationViewController setDiaEvento:self.diaEvento];
    }else{
        NSLog(@"NO");
    }
}

#pragma mark - Header Methods

- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImagesHeader.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    // Create the page.
    CGRect frame = self.scrollView.bounds;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0.0f;
    
    // Creates UIImageView and adds it to the scrollView.
    UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImagesHeader objectAtIndex:page]];
    newPageView.contentMode = UIViewContentModeScaleAspectFit;
    newPageView.frame = frame;
    [self.scrollView addSubview:newPageView];
    
    // Replaces old (empty) page with the new page created
    [self.pageViewsHeader replaceObjectAtIndex:page withObject:newPageView];
}


- (void)purgePage:(NSInteger)page {
    if (page < 0 || page >= self.pageImagesHeader.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    
    // Remove a page from the scroll view and reset the container array
    UIView *pageView = [self.pageViewsHeader objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViewsHeader replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}

- (void)loadVisiblePages
{
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
    for (NSInteger i=lastPage+1; i<self.pageImagesHeader.count; i++) {
        [self purgePage:i];
    }
    
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages that are now on screen
    [self loadVisiblePages];
    NSLog(@"Scrolled!");
    
    /*
    if(self.pageImagesHeader.count>1){
        if (self.scrollView.contentOffset.x == (self.pageImagesHeader.count-1)*320)
        {
            [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,480) animated:NO];
            
        }
        else if (self.scrollView.contentOffset.x == 0)
        {
            // user is scrolling to the right from image 10 to image 1.
            // reposition offset to show image 1 that is on the left in the scroll view
            [self.scrollView scrollRectToVisible:CGRectMake(960,0,320,480) animated:NO];
            
        }
    }*/
    
    
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
