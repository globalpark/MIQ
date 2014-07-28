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

//@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemStart;


@end
