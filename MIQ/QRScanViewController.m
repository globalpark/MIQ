//
//  QRScanViewController.m
//  MIQ
//
//  Created by Work Station on 7/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "QRScanViewController.h"

@interface QRScanViewController ()

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic) BOOL isReading;
@property (strong, nonatomic) UIWebView *webView;
@property (weak, nonatomic) UIBarButtonItem *btnBack;
@property (weak, nonatomic) UIBarButtonItem *btnForward;
@property (weak, nonatomic) UIBarButtonItem *btnRefresh;
@property (weak, nonatomic) UIBarButtonItem *btnStop;
@property (strong, nonatomic) UIToolbar *toolbar;

-(BOOL)startReading;
-(void)stopReading;
-(void)loadBeepSound;
-(void)updateButtons;
-(void)checkToolbar;
-(void)showToolbar;
-(void)hideToolbar;


@end

@implementation QRScanViewController
{
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //---- Initial Setup ----//
    
    
    // Create de views
    UIView *browserView;

    browserView = [[UIView alloc]initWithFrame:CGRectMake(0, 568 , 320, 568)];
    browserView.alpha = 0.6f;
    browserView.tag = 1;
    
    
    UINavigationBar *browserBar;
    
    browserBar =[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    browserBar.tag = 2;
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, 320, 504)];
    self.webView.tag = 3;
    self.webView.delegate = self;
    
    
    
    //---- Create the toolbar ----//
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 568, 320, 44)];
    self.toolbar.tag = 4;
    self.toolbar.translucent = NO;
    
    // Create the buttons

    UIBarButtonItem *btnStop = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                                                      target:self
                                                                                      action:@selector(cerrarBrowser)];
    btnStop.tintColor = [UIColor colorWithRed:2.0f/255.0f green:119.0f/255.0f blue:178.0f/255.0f alpha:1];
    

    UIBarButtonItem *btnRefresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                      target:self
                                                                                      action:@selector(refreshWebView)];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:nil
                                                                               action:nil];
    
    btnRefresh.tintColor = [UIColor colorWithRed:2.0f/255.0f green:119.0f/255.0f blue:178.0f/255.0f alpha:1];
    
    btnRefresh.enabled = FALSE;
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(goPageBack) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_browser"] forState:UIControlStateNormal];
    //[backBtn setImage:[UIImage imageNamed:@"back_browserActive"] forState:UIControlStateDisabled];
    backBtn.frame=CGRectMake(0.0, 0.0, 13.0, 23.0);
    [backBtn addTarget:self action:@selector(goPageBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithCustomView:backBtn ];
    
    
    
    UIButton *fwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fwdBtn addTarget:self action:@selector(goPageForward) forControlEvents:UIControlEventTouchUpInside];
    [fwdBtn setBackgroundImage:[UIImage imageNamed:@"forward_browser"] forState:UIControlStateNormal];
    //[fwdBtn setImage:[UIImage imageNamed:@"forward_browser_active"] forState:UIControlStateDisabled];
    fwdBtn.frame=CGRectMake(0.0, 0.0, 13.0, 23.0);
    [fwdBtn addTarget:self action:@selector(goPageForward) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnForward = [[UIBarButtonItem alloc] initWithCustomView:fwdBtn] ;
    
    btnForward.enabled = FALSE;
    btnBack.enabled = FALSE;
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    items = [[NSMutableArray alloc]initWithObjects:btnBack, spaceItem, btnForward,spaceItem, spaceItem,spaceItem,spaceItem, btnRefresh, nil];
    [self.toolbar setItems:items animated:NO];
    
    
    
    
    
    //---- Create the close button ----//
    
    UIBarButtonItem *btnCerrarBrowser = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                                                     target:self
                                                                                      action:@selector(cerrarBrowser)];
    btnCerrarBrowser.tintColor = [UIColor colorWithRed:2.0f/255.0f green:119.0f/255.0f blue:178.0f/255.0f alpha:1];
    
    
    
    //---- Create the share button ----//
    
    
    UIBarButtonItem *btnShare = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                target:self
                                                                action:@selector(shareLink)];
    btnShare.tintColor = [UIColor colorWithRed:2.0f/255.0f green:119.0f/255.0f blue:178.0f/255.0f alpha:1];
    
    

    
    //---- Navigation Item ----//

    
    // create a UINavigationItem and add the button in the right hand side
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:nil];
    navItem.rightBarButtonItem = btnShare;
    navItem.leftBarButtonItem = btnCerrarBrowser;
    
    // add the UINavigationItem to the navigation bar
    [browserBar pushNavigationItem:navItem animated:NO];
    
    
    
    
    
    //[browserView addSubview:self.webView];
    [browserView addSubview:browserBar];
    
    
    [self.tabBarController.view addSubview:browserView];
    [self.tabBarController.view addSubview:self.toolbar];
    
    self.title = @"SCAN";
    self.flashlightOn = NO;
    
    // Initially make the captureSession object nil.
    self.captureSession = nil;
    
    // Set the initial value of the flag to NO.
    self.isReading = YES;
    
    // Begin loading the sound effect so to have it ready for playback when it's needed.
    [self loadBeepSound];
    [self startReading];
    [self hideToolbar];
    self.webView.hidden = NO;
    self.webView.scalesPageToFit = YES;

    self.instruccionesView.hidden = YES;
    
    
    
    // Gesture recognier for the instrucciones button
    UITapGestureRecognizer *tapOnInstrucciones = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView:)];
    [self.instruccionesView addGestureRecognizer:tapOnInstrucciones];
    self.instruccionesView.userInteractionEnabled = YES;
    
    
    // Disable cache
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:0 diskPath:nil];
    [NSURLCache setSharedURLCache:sharedCache];
    
}








#pragma mark - QR Code Main Method

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    
    // Cast the views
    UIView *browserWindow =[self.tabBarController.view viewWithTag:1];
    UINavigationBar *bar = (UINavigationBar *)[browserWindow viewWithTag:2];
    
    //[self.tabBarController.view addSubview:self.toolbar];
    
    [browserWindow addSubview:self.webView];
    
    
    
    // Check if the metadataObjects array is not nil and it contains at least one object.
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        
        // Get the metadata object.
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            
            // Get the URL (read text) from the metadataObj
            NSString *textoURL = [metadataObj stringValue];
            
            // Store it as a URL
            NSURL *url = [NSURL URLWithString:textoURL];
            
            // Create the URL Request
            NSURLRequest *loadURL   = [[NSURLRequest alloc] initWithURL:url];
    
            
            
            
            
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                // Show the WebPage with animation (Slide up)
                // Turn off the torch and hide instructions once the QRCode is read
                [self torchOnOff:NO];
                self.webView.hidden = NO;
                [UIView animateWithDuration:0.35 animations:^{
                    browserWindow.frame =  CGRectMake(0,0, 320, 568);
                    browserWindow.alpha = 1.0f;
                    bar.topItem.title = textoURL;
                    
                } completion:^(BOOL completed){
                    
                    if(completed)
                    {
                        self.viewPreview.hidden = YES;
                        self.btnInstr.hidden = YES;
                        self.btnLuz.hidden = YES;
                        self.instruccionesView.hidden = YES;
                    }
                    ;
                }];
                
                
                
                
                // Load the request to the webView
                [self.webView loadRequest:loadURL];
                
            }];
            
            // Stop the reading session of the QR Code
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
            //self.isReading = YES;
            
            // If the audio player is not nil, then play the sound effect
            if (self.audioPlayer) {
                [self.audioPlayer play];
            }
        }
    }
    
    
    
}









#pragma mark - QR Code Methods

- (BOOL)startReading {
    NSError *error;
    
    // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
    // as the media type parameter.
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Get an instance of the AVCaptureDeviceInput class using the previous device object.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (!input) {
        // If any error occurs, simply log the description of it and don't continue any more.
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    // Initialize the captureSession object.
    self.captureSession = [[AVCaptureSession alloc] init];
    // Set the input device on the capture session.
    [self.captureSession addInput:input];
    
    
    // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [self.captureSession addOutput:captureMetadataOutput];
    
    // Create a new serial dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
    self.videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
    [self.videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.videoPreviewLayer setFrame:self.viewPreview.layer.bounds];
    [self.viewPreview.layer addSublayer:self.videoPreviewLayer];
    
    
    // Start video capture.
    [self.captureSession startRunning];
    
    return YES;
}


-(void)stopReading{
    // Stop video capture and make the capture session object nil.
    [self.captureSession stopRunning];
    self.captureSession = nil;
    
    // Remove the video preview layer from the viewPreview view's layer.
    //[self.videoPreviewLayer removeFromSuperlayer];
}



-(void)loadBeepSound
{
    // Get the path to the beep.mp3 file and convert it to a NSURL object.
    NSString *beepFilePath = [[NSBundle mainBundle] pathForResource:@"beep" ofType:@"mp3"];
    NSURL *beepURL = [NSURL URLWithString:beepFilePath];
    
    NSError *error;
    
    // Initialize the audio player object using the NSURL object previously set.
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:beepURL error:&error];
    if (error) {
        // If the audio player cannot be initialized then log a message.
        NSLog(@"Could not play beep file.");
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        // If the audio player was successfully initialized then load it in memory.
        [self.audioPlayer prepareToPlay];
    }
}







- (void)torchOnOff: (BOOL) onOff
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: onOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
        [device unlockForConfiguration];
        
    }
}






-(IBAction)toggleFlash:(id)sender
{
    if(self.flashlightOn)
    {
        [self torchOnOff:NO];
        self.flashlightOn = NO;
    }
    else
    {
        [self torchOnOff:YES];
        self.flashlightOn = YES;
    }
}







- (IBAction)showInstructionts:(id)sender {
    self.instruccionesView.hidden = NO;
    self.btnInstr.hidden = YES;
    
    
}









-(void)dismissView:(UITapGestureRecognizer *)gestureRecognizer
{
    self.instruccionesView.hidden = YES;
    self.btnInstr.hidden = NO;
}










#pragma mark - UIWebView Custom Methods

-(void)refreshWebView
{
    [self.webView reload];
}


-(void)cerrarBrowser
{
    
    [self.webView stopLoading];
    self.viewPreview.hidden = NO;
    self.btnInstr.hidden = NO;
    self.btnLuz.hidden = NO;
    self.instruccionesView.hidden = YES;

    
    
    
    
    // Cast the views
    UIView *browserWindow =[self.tabBarController.view viewWithTag:1];
    
    
    
    
    [UIView animateWithDuration:0.35 animations:^{
        browserWindow.frame =  CGRectMake(0,568, 320, 568);
        browserWindow.alpha = 0.8f;
    } completion:^(BOOL completed){
        
        if(completed)
        {
            [self startReading];
            self.webView.hidden = YES;
        }
            ;
    }];
    
    
    
    [self hideToolbar];
    [self.webView removeFromSuperview];
    //[self.toolbar removeFromSuperview];

}










-(void)shareLink
{
    NSURL *currentURL = [[self.webView request] URL];
    NSString *url = [currentURL absoluteString];
    NSArray *objectsToShare = @[url];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];
}







-(void)showToolbar
{
        [UIView animateWithDuration:0.35 animations:^{
            self.toolbar.frame =  CGRectMake(0,524, 320, 44);
        
        }];
}





-(void)hideToolbar
{
    [UIView animateWithDuration:0.35 animations:^{
        self.toolbar.frame =  CGRectMake(0,568, 320, 44);
    }];
}







-(void) checkToolbar
{
    if(!self.webView.hidden){
        if(self.webView.canGoBack || self.webView.canGoForward){
            [self showToolbar];
            NSLog(@"Yup, it can");
        }
        else{
            [self hideToolbar];
            NSLog(@"NOOOO");
        }
    }
}



- (void)updateButtons
{
    if(self.webView.canGoForward)
    {
        self.btnForward.enabled = TRUE;
        NSLog(@"CAN GO FWD");
    }
    
    if(self.webView.canGoBack)
    {
        self.btnBack.enabled = TRUE;
        NSLog(@"CAN GO BACK");
    }
    
    
    
 
}


-(void)goPageForward
{
    [self.webView goForward];
}



-(void)goPageBack
{
    [self.webView goBack];
}


#pragma mark - UIWebView Delegate Methods

- (BOOL)webView:(UIWebView *)myWebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    return TRUE;
}






- (void)webViewDidStartLoad:(UIWebView *)webView{
    //show indicator while loading website
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self updateButtons];
    [self checkToolbar];
    
}








- (void)webViewDidFinishLoad:(UIWebView *)webView {
    UIView *browserWindow =[self.tabBarController.view viewWithTag:1];
    UINavigationBar *bar = (UINavigationBar *)[browserWindow viewWithTag:2];
    NSURL *currentURL = [[self.webView request] URL];
    NSString *url = [currentURL absoluteString];

    
    bar.topItem.title = url;
    //turn off indicator and display the name of the website in the navBar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    
    [self checkToolbar];
    [self updateButtons];
}






- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
    [self checkToolbar];
}




@end
