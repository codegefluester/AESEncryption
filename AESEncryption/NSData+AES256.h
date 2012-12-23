//
//  NSData+AES256.h
//  AESEncryption
//
//  Created by Björn Kaiser on 23.12.12.
//  Copyright (c) 2012 Björn Kaiser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)

- (NSData*) AES256EncryptWithKey:(NSString*)key;
- (NSData*) AES256DecryptWithKey:(NSString*)key;

@end
