//
//  ViewController.m
//  AESEncryption
//
//  Created by Björn Kaiser on 23.12.12.
//  Copyright (c) 2012 Björn Kaiser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.crypter = [CGFCrypter sharedCrypter];
	
	NSString *secret = @"My super secret message to Santa";
	
	NSData *encrypted = [self.crypter encryptString:secret usingEncoding:NSUTF8StringEncoding];
	
	NSString *decrypted = [[NSString alloc] initWithData:[self.crypter decryptData:encrypted] encoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
