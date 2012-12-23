//
//  CGFCrypter.m
//  AESEncryption
//
//  Created by Björn Kaiser on 23.12.12.
//  Copyright (c) 2012 Björn Kaiser. All rights reserved.
//

#import "CGFCrypter.h"
#import "NSData+AES256.h"
#import "NSData+RSA.h"

@interface CGFCrypter ()
	- (void) setup; // We'll perform basic setup tasks here
	- (NSData *) generateRandomDataWithLength:(int) length;
@end

@implementation CGFCrypter

static CGFCrypter *_shared = nil;

+ (CGFCrypter*) sharedCrypter
{
	if (_shared == nil) {
		_shared = [[CGFCrypter alloc] init];
	}
	return _shared;
}

- (id) init
{
	NSAssert(_shared == nil, @"No second instance buddy");
	self = [super init];
	if (self) {
		[self setup];
	}
	return self;
}

- (void) setup
{
	self.symmetricKey = [self generateRandomDataWithLength:256];
}

#define RKRandom(x) (arc4random() % ((NSUInteger)(x) + 1))		//!< Nice random method
- (NSData *) generateRandomDataWithLength:(int) length {
    char bytes[length];
    for (int i=0; i<length; i++) {
		bytes[i] = (char)(RKRandom(256-32)+32);
	}
	return [NSData dataWithBytes:bytes length:length];
}

#pragma mark -
#pragma mark Public methods
- (void) setEncryptionKey:(NSString *)key
{
	self.symmetricKey = [key dataUsingEncoding:NSASCIIStringEncoding];
}

- (NSData*) encryptedKeyWithCertAtPath:(NSString*)certificatePath
{
	return [self.symmetricKey encryptWithKeyFromCert:certificatePath];
}

- (NSData*) encryptData:(NSData *)data
{
	return [data AES256EncryptWithKey:[[NSString alloc] initWithData:self.symmetricKey encoding:NSASCIIStringEncoding]];
}

- (NSData*) decryptData:(NSData *)data
{
	return [data AES256DecryptWithKey:[[NSString alloc] initWithData:self.symmetricKey encoding:NSASCIIStringEncoding]];
}

- (NSData*) encryptString:(NSString*)theString usingEncoding:(NSStringEncoding)enc
{
	return [self encryptData:[theString dataUsingEncoding:enc]];
}

- (NSData*) decryptString:(NSString*)theString usingEncoding:(NSStringEncoding)enc
{
	return [self decryptData:[theString dataUsingEncoding:enc]];
}

@end
