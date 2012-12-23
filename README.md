AESEncryption
=============
A simple class to add encryption to your iOS App. I actually just put together code from several sources
and created a simple helper class to encrypt data on iOS.

Usage example
=============
You'll need to add the following to your Xcode project:
- Security.framework
- CGFCrypter.h
- NSData+AES256.h
- NSData+RSA.h

Then use the following sample code to encrypt a string:
```
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  CGFCrypter *crypter = [CGFCrypter sharedCrypter];
  [crypter setEncryptionKey:@"MyEncryptionKeyChangeMe!"];
  
  NSString *secret = @"My super secret message to Santa";
  
  // Encrypt
  NSData *encrypted = [crypter encryptString:secret usingEncoding:NSUTF8StringEncoding];

  // Decrypt
  NSString *decrpyted = [[NSString alloc] initWithData:[crypter decryptData:encrypted] encoding:NSUTF8StringEncoding];
  
}
```
