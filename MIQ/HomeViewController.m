//
//  HomeViewController.m
//  MIQ
//
//  Created by Work Station on 7/9/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong) NSArray *pageImagesHeader;
@property (nonatomic, strong) NSMutableArray *pageViewsHeader;

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
@end

@implementation HomeViewController

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
    
    
    //Change status bar to Light theme
    [self setNeedsStatusBarAppearanceUpdate];
    
#pragma mark - ScrollView Header
    // Set up images
    self.pageImagesHeader = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"home1"],
                       [UIImage imageNamed:@"home1"],
                       [UIImage imageNamed:@"home1"],
                       nil];
    
    NSInteger pageCount = self.pageImagesHeader.count;
    
    // Indicate how many pages there are to the pageControl
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    
    // Create the array that holds the images
    self.pageViewsHeader = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViewsHeader addObject:[NSNull null]]; // Placeholder
    }
    
#pragma mark - Low screen Buttons
    
//Create button for Coloquio Cervantino
    
    UIButton *cervantinoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cervantinoButton.frame = CGRectMake(5, 408, 100, 100);
    [cervantinoButton setImage:[UIImage imageNamed:@"coloquio_home"] forState:UIControlStateNormal];
    cervantinoButton.adjustsImageWhenHighlighted = YES;
    cervantinoButton.tag = 1;
    
    
    [cervantinoButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cervantinoButton];
    
    
    
    
    
//Create button for Calendario de Eventos
    
    
    UIButton *calendarioButton = [UIButton buttonWithType:UIButtonTypeCustom];
    calendarioButton.frame = CGRectMake(110, 408, 100, 100);
    [calendarioButton setImage:[UIImage imageNamed:@"calendario_home"] forState:UIControlStateNormal];
    calendarioButton.adjustsImageWhenHighlighted = YES;
    calendarioButton.tag = 2;
    
    [calendarioButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
     
    [self.view addSubview:calendarioButton];
    
    
    
    
//Create button for ¿Cómo llegar?
    
    UIButton *comoLlegarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    comoLlegarButton.frame = CGRectMake(215, 408, 100, 100);
    [comoLlegarButton setImage:[UIImage imageNamed:@"llegar"] forState:UIControlStateNormal];
    comoLlegarButton.adjustsImageWhenHighlighted = YES;
    comoLlegarButton.tag = 3;
    
    [comoLlegarButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:comoLlegarButton];

}



-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // The width of each page is the same widht od the visible scrollView area. The total scrollView area is the width of every page multiplied by the number of pages.
    CGSize pagesScrollViewSize = self.scrollViewHeader.frame.size;
    self.scrollViewHeader.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeader.count, pagesScrollViewSize.height);
    
    // Mehtod that loads pages initially
    [self loadVisiblePages];
}

#pragma mark - ScrollView Methods

// Loads initial Pages
- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImagesHeader.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    
    // Check if view is already loaded. If not, the object will be null.
    UIView *pageView = [self.pageViewsHeader objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        // Create the page.
        CGRect frame = self.scrollViewHeader.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        // Creates UIImageView and adds it to the scrollView.
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImagesHeader objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollViewHeader addSubview:newPageView];
        // Replaces old (empty) page with the new page created
        [self.pageViewsHeader replaceObjectAtIndex:page withObject:newPageView];
    }
}







// Purges a page that was previously created via loadPage:
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







- (void)loadVisiblePages {
    // First, determine which page is currently visible
    CGFloat pageWidth = self.scrollViewHeader.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollViewHeader.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
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
    for (NSInteger i=lastPage+1; i<self.pageImagesHeader.count; i++) {
        [self purgePage:i];
    }
}







- (void)scrollViewDidScroll:(UIScrollView *)scrollViewHeader {
    // Load the pages that are now on screen
    [self loadVisiblePages];
}





#pragma mark - Segue

-(void) performSegue:(UIButton*)sender
{
    
    switch(sender.tag)
    {
        case 1: [self performSegueWithIdentifier:@"homeToColoquio" sender:self];
        break;
            
        case 2: [self performSegueWithIdentifier:@"homeToCalendario" sender:self];
        break;
        
        case 3: [self performSegueWithIdentifier:@"homeToComoLlegar" sender:self];
        break;
            
            
    }
    
    /*
    // Segue to Coloquio Cervantino
    if([sender tag] == 1){
        [self performSegueWithIdentifier:@"homeToComoLlegar" sender:self];
        
    }
    
    //Segue for Calendario Eventos
    if([sender tag] == 2){
        [self performSegueWithIdentifier:@"SegueIdentifier" sender:self];
        
    }
    
    // Segue for ¿Cómo llegar?
    if([sender tag] == 3){
        [self performSegueWithIdentifier:@"SegueIdentifier" sender:self];
        
    }
*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Setup

//Change status bar to Light theme
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
