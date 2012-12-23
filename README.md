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

Credits
=============
**NSData+RSA**     
by [Pascal Bihler](http://pascal-bihler.de)    

**NSData+AES256**    
I don't knwo who made it, I got it from [here](http://pastie.org/426530). 
If you are the creator of this category, let me know :-)

License
=============
The code is provided on a as is basis. Do what you want with it, make it better, use it or sell it.
