//
//  HomeViewController.m
//  MIQ
//
//  Created by Work Station on 7/9/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>

@interface HomeViewController ()

//---- Properties for Header scrollView ----//

@property (nonatomic, strong) NSArray *pageImagesHeader;
@property (nonatomic, strong) NSMutableArray *pageViewsHeader;


//---- Properties for Tickets scrollView ----//

@property (nonatomic, strong) NSMutableArray *pageViewsTickets;
@property (nonatomic, strong) NSArray *pageImagesTickets;


//---- Methods for the scrollViews ----//

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
- (void)loadVisiblePagesTickets;
- (void)loadPageTickets:(NSInteger)page;
- (void)purgePageTickets:(NSInteger)page;

@end



@implementation HomeViewController
{
    
    //---- Timer for the Header scrollView animation ----//
    
    NSTimer *timerImages;
    
}


#pragma mark - Initial Setup

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    //------ View Setup ------//
    
    // Title
    self.title = @"HOME";
    
    //Change Title's font and color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIFont fontWithName:@"AvenirNext-Medium" size:14],
                                                                     NSFontAttributeName,
                                                                     [UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1],
                                                                     NSForegroundColorAttributeName,
                                                                     nil]];
    
    /*
     // Trick to hide the Title label
     UILabel *label = [[UILabel alloc] init];
     self.navigationItem.titleView = label;
     */
    
    
    
    
    
    //---- Start the autoplay for the images----//
    
    [self startTimer];
    
    
    
    
    
    
    //---- Header image translucent bar ----//
    
    UIImage *bar_foto = [UIImage imageNamed:@"bar_foto"];
    UIImageView *imageViewBarFoto = [[UIImageView alloc] initWithImage: bar_foto];
    imageViewBarFoto.frame = CGRectMake(0, 167, 320, 18);
    
    [self.view insertSubview:imageViewBarFoto atIndex:8];
    
    
    
    
    //------ SCROLLVIEW HEADER ------//
    
    
    self.scrollViewHeader.tag = 1;
    
    
    //---- Tap Gesture to detect which image was tapped ----//
    
    UITapGestureRecognizer *singleFingerTapHome =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapHome:)];
    [self.scrollViewHeader addGestureRecognizer:singleFingerTapHome];
    
    
    
    
    
    //------ Set up images ------//
    
    self.pageImagesHeader = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"home3"],
                             [UIImage imageNamed:@"home1"],
                             [UIImage imageNamed:@"home2"],
                             [UIImage imageNamed:@"home3"],
                             [UIImage imageNamed:@"home1"],
                             nil];
    
    
    
    
    //---- Set up pageCount ----//
    
    // Asign the pageCount
    NSInteger pageCount = self.pageImagesHeader.count;
    
    // Indicate how many pages there are to the pageControl (minus 2 because of the infinite scroll trick)
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount-2;
    
    // Create the array that holds the images
    self.pageViewsHeader = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViewsHeader addObject:[NSNull null]]; // Placeholder
    }
    
    
    
    
    
    
    
    
    //------ SCROLL VIEW TICKETS ------//
    
    
    //---- Create the  scrollView frame ----//
    
    
    self.scrollViewTickets.frame=CGRectMake(0, 289, 320, 119);
    self.scrollViewTickets.tag = 2;
    
    
    
    //---- Tap Gesture to detect which image was tapped ----//
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.scrollViewTickets addGestureRecognizer:singleFingerTap];
    
    
    
    
    
    //---- Set up images ----//
    
    //Create array and add the images
    self.pageImagesTickets = [[NSArray alloc]init];
    self.pageImagesTickets = [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"eventos_home"],
                              [UIImage imageNamed:@"lunes_home"],
                              [UIImage imageNamed:@"martes_home"],
                              [UIImage imageNamed:@"miercoles_home"],
                              [UIImage imageNamed:@"jueves_home"],
                              [UIImage imageNamed:@"viernes_home"],
                              [UIImage imageNamed:@"eventos_home"],
                              [UIImage imageNamed:@"lunes_home"],
                              nil];
    
    
    NSInteger pageCountTickets = self.pageImagesTickets.count;
    
    // Create the array for the views
    self.pageViewsTickets = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCountTickets; ++i) {
        [self.pageViewsTickets addObject:[NSNull null]]; // Placeholder
    }
    
    
    
    
    
    
    
    
    //------ LOWER SCREEN BUTTONS ------//
    
    
    //---- Create button for Coloquio Cervantino ----//
    
    UIButton *cervantinoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cervantinoButton.frame = CGRectMake(5, 345, 100, 100);
    [cervantinoButton setImage:[UIImage imageNamed:@"coloquio_home"] forState:UIControlStateNormal];
    cervantinoButton.adjustsImageWhenHighlighted = YES;
    cervantinoButton.tag = 1;
    
    // Action to be performed when button is clicked
    [cervantinoButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cervantinoButton];
    
    
    
    
    
    //---- Create button for Calendario de Eventos ----//
    
    UIButton *calendarioButton = [UIButton buttonWithType:UIButtonTypeCustom];
    calendarioButton.frame = CGRectMake(110, 345, 100, 100);
    [calendarioButton setImage:[UIImage imageNamed:@"calendario_home"] forState:UIControlStateNormal];
    calendarioButton.adjustsImageWhenHighlighted = YES;
    calendarioButton.tag = 2;
    
    // Action to be performed when button is clicked
    [calendarioButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:calendarioButton];
    
    
    
    
    
    //---- Create button for ¿Cómo llegar? ----//
    
    UIButton *comoLlegarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    comoLlegarButton.frame = CGRectMake(215, 345, 100, 100);
    [comoLlegarButton setImage:[UIImage imageNamed:@"llegar"] forState:UIControlStateNormal];
    comoLlegarButton.adjustsImageWhenHighlighted = YES;
    comoLlegarButton.tag = 3;
    
    // Action to be performed when button is clicked
    [comoLlegarButton addTarget:self action:@selector(performSegue:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:comoLlegarButton];
    
    //Desplegar el login
    PFUser *currentUser = [PFUser currentUser];
    if(currentUser){
        NSLog(@"Current User Name: %@", currentUser.username);
    }else{
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
    
}











-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    //---- Change Navigation Bar Background ----//
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarCON"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    //------ Set up Header scrollView------//
    
    // The width of each page is the same widht of the visible scrollView area. The total scrollView area is the width of every page multiplied by the number of pages.
    CGSize pagesScrollViewSize = self.scrollViewHeader.frame.size;
    self.scrollViewHeader.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImagesHeader.count, pagesScrollViewSize.height);
    
    
    // Set initial offset according to the day of the week
    
    NSDate *today = [NSDate date];
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    
    [myFormatter setDateFormat:@"c"];
    NSString *dayOfWeek = [myFormatter stringFromDate:today];
    int dayOfTheWeek = [dayOfWeek intValue];
    
    switch(dayOfTheWeek){
            //Lunes
        case 2:
            [self.scrollViewTickets setContentOffset:CGPointMake(320,0)];
            break;
            
            //Martes
        case 3:
            [self.scrollViewTickets setContentOffset:CGPointMake(640,0)];
            break;
            
            //Miercoles
        case 4:
            [self.scrollViewTickets setContentOffset:CGPointMake(960,0)];
            break;
            
            //Jueves
        case 5:
            [self.scrollViewTickets setContentOffset:CGPointMake(1280,0)];
            break;
            
            //Viernes
        case 6:
            [self.scrollViewTickets setContentOffset:CGPointMake(1600,0)];
            break;
            
            //Sábado y Domingo
        default:
            [self.scrollViewTickets setContentOffset:CGPointMake(1920,0)];
            break;
    }
    
    
    
    
    [self.scrollViewHeader setContentOffset:CGPointMake(320, 0)];
    
    
    
    
    //------ Set up Tickets scrollView------//
    
    // The width of each page is the same widht of the visible scrollView area. The total scrollView area is the width of every page multiplied by the number of pages.
    CGSize pagesScrollViewSizeTickets = self.scrollViewTickets.frame.size;
    self.scrollViewTickets.contentSize = CGSizeMake(pagesScrollViewSizeTickets.width * self.pageImagesTickets.count, pagesScrollViewSizeTickets.height);
    
    
    
    
    
    
    
    //----- Mehtod that loads pages initially -----//
    
    [self loadVisiblePages];
    [self loadVisiblePagesTickets];
}













#pragma mark - Scroll View General Methods


-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    //---- Stop the timer when images will be dragged ----//
    
    if(scrollView.tag == 1){
        [self stopTimer];
    }
}







-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //---- Restart the Autoplay when finished scrolling ----//
    
    if(scrollView.tag == 1){
        [self startTimer];
    }
    
}








- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages that are now on screen
    [self loadVisiblePages];
    [self loadVisiblePagesTickets];
    
    
    //---- Infinite scroll Header ----//
    
    if(scrollView.tag == 1){
        if (self.scrollViewHeader.contentOffset.x == (self.pageImagesHeader.count-1)*320) {
            [self.scrollViewHeader scrollRectToVisible:CGRectMake(320,0,320,480) animated:NO];
        }
        
        else if (self.scrollViewHeader.contentOffset.x == 0) {
            // user is scrolling to the right from image 10 to image 1.
            // reposition offset to show image 1 that is on the left in the scroll view
            [self.scrollViewHeader scrollRectToVisible:CGRectMake(960,0,320,480) animated:NO];
        }
    }
    
    
    
    
    //---- Infinite scroll Tickets ----//
    
    else {
        if (self.scrollViewTickets.contentOffset.x == (self.pageImagesTickets.count-1)*320) {
            //[self.scrollViewTickets scrollRectToVisible:CGRectMake(320,225,320,119) animated:NO];
            [self.scrollViewTickets setContentOffset:CGPointMake(320, 0.0) animated:NO];
        }
        
        else if (self.scrollViewTickets.contentOffset.x == 0) {
            // user is scrolling to the right from image 10 to image 1.
            // reposition offset to show image 1 that is on the left in the scroll view
            //[self.scrollViewTickets scrollRectToVisible:CGRectMake(1920,225,320,119) animated:NO];
            [self.scrollViewTickets setContentOffset:CGPointMake(1920, 0.0) animated:NO];
        }
    }
    
    
}









/*
 -(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
 {
 if(scrollView.tag == 2){
 NSLog(@"x %i", xPosition);
 [self.scrollViewTickets setContentOffset:CGPointMake(xPosition-5, 0) animated:YES];
 }
 }
 */










-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
    //------ Setup for peeking the next Ticket ------//    <- Made infinite scrolling instead
    
    
    /*
     if(scrollView.tag == 2){
     if(fabs(velocity.x)>0){
     NSLog(@"aqui %f", velocity.x);
     
     NSLog(@"x %i", xPosition);
     int multiplier;
     
     if(velocity.x>0){
     NSLog(@"x %i", xPosition);
     multiplier = ((int)self.scrollViewTickets.contentOffset.x/310)+1;
     }
     else{
     multiplier =(int)self.scrollViewTickets.contentOffset.x/310;
     
     }
     
     NSLog(@"x %i", xPosition);
     xPosition= multiplier*310;
     }
     else{
     NSLog(@"HOLA %i", xPosition);
     //xPosition=(int)self.scrollViewTickets.contentOffset.x/310;
     [self.scrollViewTickets setContentOffset:CGPointMake(xPosition, 0) animated:YES];
     
     
     }
     }
     */
    
}









#pragma mark - Header ScrollView Methods


//---- Start the timer for the autoplay ----//

-(void) startTimer
{
    //---- Autoplay for the images ----//
    
    timerImages = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(changePhoto) userInfo:nil repeats:YES];
}







//---- Stop the timer for the autoplay ----//

-(void) stopTimer
{
    //---- Stop the autoplay for the images ----//
    
    [timerImages invalidate];
    
}






//---- Change the photo of the header ----//

- (void) changePhoto
{
    
    CGFloat currentOffset = self.scrollViewHeader.contentOffset.x;
    CGFloat newOffset = currentOffset + 320;
    
    NSInteger count = self.pageImagesHeader.count -1;
    if(newOffset <= count *320)
        
    {
        [self.scrollViewHeader setContentOffset:CGPointMake(newOffset, 0.0) animated:YES];
    }
    
}









//---- Loads initial Pages for Header ----//

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







//---- Purges a page that was previously created via loadPage: ----//

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
    CGFloat pageWidth = self.scrollViewHeader.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollViewHeader.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    // Update the page control
    self.pageControl.currentPage = page-1;
    
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












#pragma mark - Tickets scrollView Methods


//---- Loads initial Pages for Tickets ----//

- (void)loadPageTickets:(NSInteger)page {
    if (page < 0 || page >= self.pageImagesTickets.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    
    // Check if view is already loaded. If not, the object will be null.
    UIView *pageView = [self.pageViewsTickets objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        
        // Create the page.
        
        CGRect frame = self.scrollViewTickets.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        
        self.scrollViewTickets.pagingEnabled = YES;
        
        // Creates UIImageView and adds it to the scrollView.
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImagesTickets objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollViewTickets addSubview:newPageView];
        
        // Replaces old (empty) page with the new page created
        [self.pageViewsTickets replaceObjectAtIndex:page withObject:newPageView];
    }
}







//---- Purges a page that was previously created via loadPageTickets: ----//

- (void)purgePageTickets:(NSInteger)page {
    if (page < 0 || page >= self.pageImagesTickets.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    
    // Remove a page from the scroll view and reset the container array
    UIView *pageView = [self.pageViewsTickets objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViewsTickets replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}










- (void)loadVisiblePagesTickets {
    // First, determine which page is currently visible
    CGFloat pageWidth = self.scrollViewTickets.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollViewTickets.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    
    // Work out which pages you want to load
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 1;
    
    // Purge anything before the first page
    for (NSInteger i=0; i<firstPage; i++) {
        [self purgePageTickets:i];
    }
    
	// Load pages in our range
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        [self loadPageTickets:i];
    }
    
	// Purge anything after the last page
    for (NSInteger i=lastPage+1; i<self.pageImagesTickets.count; i++) {
        [self purgePageTickets:i];
    }
}














#pragma mark - Segues



//------ Method called when an image of the header is selected ------//

- (void)handleSingleTapHome:(UITapGestureRecognizer *)gestureRecognizer
{
    
    UIScrollView *scroll = (UIScrollView*)gestureRecognizer.view;
    
    // Check which button was pressed, depending on its position
    int imgClicked = scroll.contentOffset.x /320;
    switch (imgClicked){
        case 0: [self performSegueWithIdentifier:@"homeToImg1" sender:self];
            break;
            
        case 1: [self performSegueWithIdentifier:@"homeToImg2" sender:self];
            break;
            
        case 2: [self performSegueWithIdentifier:@"homeToImg3" sender:self];
            break;
    }
}







//------ Method called when a Ticket is selected ------//

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    
    UIScrollView *scroll = (UIScrollView*)recognizer.view;
    
    // Check which Ticket was pressed, depending on its position
    int imgClicked = scroll.contentOffset.x /320;
    switch (imgClicked){
        case 0: [self performSegueWithIdentifier:@"homeToLunes" sender:self];
            break;
            
        case 1: [self performSegueWithIdentifier:@"homeToMartes" sender:self];
            break;
            
        case 2: [self performSegueWithIdentifier:@"homeToMiércoles" sender:self];
            break;
            
        case 3: [self performSegueWithIdentifier:@"homeToJueves" sender:self];
            break;
            
        case 4: [self performSegueWithIdentifier:@"homeToViernes" sender:self];
            break;
            
        case 5: [self performSegueWithIdentifier:@"homeToEventos" sender:self];
            break;
    }
}







//---- Lower part of the screen buttons ----//

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





#pragma mark -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
