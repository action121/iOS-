

#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)

#import <UIKit/UIKit.h>

@interface UIImage (AFNetworking)

+ (UIImage*) safeImageWithData:(NSData*)data;

@end

#endif
