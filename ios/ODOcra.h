
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface ODOcra : NSObject <RCTBridgeModule>


+ (NSString *) generateOCRAForSuite:(NSString*) ocraSuite
                                key:(NSString*) key
                            counter:(NSString*) counter
                           question:(NSString*) question
                           password:(NSString*) password
                 sessionInformation:(NSString*) sessionInformation
                          timestamp:(NSString*) timeStamp
                              error:(NSError**) error;
@end
  
