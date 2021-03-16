//
//  GSLFileTypeMappings.m
//  GSLFileTypeMappings
//

@import Foundation;

#import "GSLFileTypeMappings.h"
#import "GSLSynthesizeSingleton.h"

@import CoreServices;

@implementation GSLFileTypeMappings

GSLSynthesizeSingleton(GSL, FileTypeMappings);

- (instancetype)init {
    return [super init];
}

- (nullable NSArray<NSString *> *)extensionsForMIMEType:(nullable NSString *)MIMEType {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)MIMEType, NULL);
    if (!UTI) {
        return nil;
    }
    CFArrayRef extensions;
    if (@available(macOS 10.10, *)) {
        // macOS 10.10+
        extensions = UTTypeCopyAllTagsWithClass(UTI, kUTTagClassFilenameExtension);
    } else {
        // macOS 10.6-10.10
        CFStringRef extension = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassFilenameExtension);
        CFIndex numValues = extension ? 1 : 0;
        extensions = CFArrayCreate(NULL, (void *)&extension, numValues, &kCFTypeArrayCallBacks);
        if (extension) {
            CFRelease(extension);
        }
    }
    CFRelease(UTI);
    return ((__bridge_transfer NSArray *)extensions ?: @[]);
}

- (nullable NSString *)preferredExtensionForMIMEType:(nullable NSString *)MIMEType {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)MIMEType, NULL);
    if (!UTI) {
        return nil;
    }
    CFStringRef extension = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassFilenameExtension);
    CFRelease(UTI);
    return (__bridge_transfer NSString *)extension;
}

- (nullable NSString *)MIMETypeForExtension:(nullable NSString *)extension {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)extension, NULL);
    if (!UTI) {
        return nil;
    }
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    return (__bridge_transfer NSString *)MIMEType;
}

@end
