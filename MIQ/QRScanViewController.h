//
//  QRScanViewController.h
//  MIQ
//
//  Created by Work Station on 7/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface QRScanViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate,UIWebViewDelegate>



@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) AVCaptureSession *AVSession;
@property (strong, nonatomic) IBOutlet UIButton *btnLuz;
@property (nonatomic) BOOL flashlightOn;
@property (strong, nonatomic) IBOutlet UIImageView *instruccionesView;
@property (strong, nonatomic) IBOutlet UIButton *btnInstr;

- (IBAction)toggleFlash:(id)sender;
- (IBAction)showInstructionts:(id)sender;

//@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemStart;


@end
