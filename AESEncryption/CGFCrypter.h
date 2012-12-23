//
//  CGFCrypter.h
//  AESEncryption
//
//  Created by Björn Kaiser on 23.12.12.
//  Copyright (c) 2012 Björn Kaiser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGFCrypter : NSObject {

}

@property (strong) NSData *symmetricKey;

+ (CGFCrypter*) sharedCrypter;

- (void) setEncryptionKey:(NSString*)key;
- (NSData*) encryptedKeyWithCertAtPath:(NSString*)certificatePath;
- (NSData*) encryptData:(NSData*)data;
- (NSData*) decryptData:(NSData*)data;
- (NSData*) encryptString:(NSString*)theString usingEncoding:(NSStringEncoding)enc;
- (NSData*) decryptString:(NSString*)theString usingEncoding:(NSStringEncoding)enc;

@end
