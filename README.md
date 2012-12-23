AESEncryption
=============
A simple class to add encryption to your iOS App. I actually just put together code from several sources
and created a simple helper class to encrypt data on iOS.

Usage example
=============
```
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.crypter = [CGFCrypter sharedCrypter];
  [self.crypter setEncryptionKey:@"MyEncryptionKeyChangeMe!"];
  
  NSString *secret = @"My super secret message to Santa";
  NSData *encrypted = [self.crypter encryptString:secret usingEncoding:NSUTF8StringEncoding];
}
```
