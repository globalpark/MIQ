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

-(BOOL)startReading;
-(void)stopReading;
-(void)loadBeepSound;

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
    UINavigationBar *browserBar;
    UIWebView *webView;
    
    browserView = [[UIView alloc]initWithFrame:CGRectMake(0, 568 , 320, 568)];
    browserView.alpha = 0.6f;
    browserView.tag = 1;
    
    browserBar =[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    browserBar.tag = 2;
    
    //---- Create the close button ----//
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"cerrar_browser"] forState:UIControlStateNormal];
    closeButton.frame=CGRectMake(0.0, 0.0, 17.0, 17.0);
    [closeButton addTarget:self action:@selector(cerrarBrowser) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *btnCerrarBrowser = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    
    
    
    
    //---- Create the share button ----//
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    shareButton.frame=CGRectMake(0.0, 0.0, 21.0, 27.0);
    [shareButton addTarget:self action:@selector(cerrarBrowser) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *btnShare = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    
    // create a UINavigationItem and add the button in the right hand side
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:nil];
    navItem.rightBarButtonItem = btnShare;
    navItem.leftBarButtonItem = btnCerrarBrowser;
    
    // add the UINavigationItem to the navigation bar
    [browserBar pushNavigationItem:navItem animated:NO];
    
    
    
    
    
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, 320, 504)];
    webView.tag = 3;
    
    [browserView addSubview:webView];
    [browserView addSubview:browserBar];
    
    
    [self.tabBarController.view addSubview:browserView];
    
    self.title = @"SCAN";
    self.flashlightOn = NO;
    
    // Initially make the captureSession object nil.
    self.captureSession = nil;
    
    // Set the initial value of the flag to NO.
    self.isReading = YES;
    
    // Begin loading the sound effect so to have it ready for playback when it's needed.
    [self loadBeepSound];
    [self startReading];
    self.webView.hidden = NO;
    self.instruccionesView.hidden = YES;
    
    
    
    // Gesture recognier for the instrucciones button
    UITapGestureRecognizer *tapOnInstrucciones = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView:)];
    [self.instruccionesView addGestureRecognizer:tapOnInstrucciones];
    self.instruccionesView.userInteractionEnabled = YES;
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







#pragma mark - AVCaptureMetadataOutputObjectsDelegate method implementation

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    
    // Cast the views
    UIView *browserWindow =[self.tabBarController.view viewWithTag:1];
    UIWebView *webView = (UIWebView *)[browserWindow viewWithTag:3];
    //UINavigationBar *browserBar = (UINavigationBar *)[browserWindow viewWithTag:2];
    
    
    
    
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
                self.viewPreview.hidden = YES;
                self.btnInstr.hidden = YES;
                self.btnLuz.hidden = YES;
                self.instruccionesView.hidden = YES;
                // Turn off the torch and hide instructions once the QRCode is read
                [self torchOnOff:NO];
                [UIView animateWithDuration:0.35 animations:^{
                    browserWindow.frame =  CGRectMake(0,0, 320, 568);
                    browserWindow.alpha = 1.0f;
                    }];
                
                
                
                // Load the request to the webView
                [webView loadRequest:loadURL];
                
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

- (void)torchOnOff: (BOOL) onOff
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: onOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
        [device unlockForConfiguration];
        
    }
}

-(void)dismissView:(UITapGestureRecognizer *)gestureRecognizer
{
    self.instruccionesView.hidden = YES;
    self.btnInstr.hidden = NO;
}




-(void)cerrarBrowser
{
    self.viewPreview.hidden = NO;
    self.viewPreview.hidden = NO;
    self.btnInstr.hidden = NO;
    self.btnLuz.hidden = NO;
    self.instruccionesView.hidden = YES;

    
    // Cast the view
    UIView *browserWindow =[self.tabBarController.view viewWithTag:1];
    
    
    [UIView animateWithDuration:0.35 animations:^{
        browserWindow.frame =  CGRectMake(0,568, 320, 568);
        browserWindow.alpha = 0.8f;
    } completion:^(BOOL completed){
        
        if(completed)
        {
            [self startReading];
        }
            ;
    }];
}


@end
