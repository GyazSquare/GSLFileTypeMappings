//
//  GSLFileTypeMappings.h
//  GSLFileTypeMappings
//

@import Foundation.NSObject;

NS_ASSUME_NONNULL_BEGIN

@interface GSLFileTypeMappings : NSObject

@property (class, readonly) GSLFileTypeMappings *sharedFileTypeMappings;

- (instancetype)init OBJC_SWIFT_UNAVAILABLE("use 'aClass.shared' instead");

- (nullable NSArray<NSString *> *)extensionsForMIMEType:(nullable NSString *)MIMEType;
- (nullable NSString *)preferredExtensionForMIMEType:(nullable NSString *)MIMEType;
- (nullable NSString *)MIMETypeForExtension:(nullable NSString *)extension;

@end

NS_ASSUME_NONNULL_END
