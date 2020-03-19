#import "VoztextoPlugin.h"
#if __has_include(<voztexto/voztexto-Swift.h>)
#import <voztexto/voztexto-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "voztexto-Swift.h"
#endif

@implementation VoztextoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVoztextoPlugin registerWithRegistrar:registrar];
}
@end
