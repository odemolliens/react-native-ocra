
#import "ODOcra.h"
#import "OCRA.h"

@implementation ODOcra

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(generateOCRAForSuite:(NSString*) ocraSuite
                  key:(NSString*) key
                  counter:(NSString*) counter
                  question:(NSString*) question
                  password:(NSString*) password
                  sessionInformation:(NSString*) sessionInformation
                  timestamp:(NSString*) timeStamp
                  resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    
    String *ocra = [self generateOCRAForSuite:ocraSuite, key:key,counbter:counter,question:question,password:password,sessionInformation:sessionInformation,timestamp:timestamp,error:error];
    
    //Do some stuff
    if(error!=nil){
         reject(@"OcraSDK", error.localizedDescription, error);
    }else{
        resolve(result);
    }
}


+ (NSString *) generateOCRAForSuite:(NSString*) ocraSuite
                                key:(NSString*) key
                            counter:(NSString*) counter
                           question:(NSString*) question
                           password:(NSString*) password
                 sessionInformation:(NSString*) sessionInformation
                          timestamp:(NSString*) timeStamp
                              error:(NSError**) error{
    return [OCRA generateOCRAForSuite:ocraSuite, key:key,counbter:counter,question:question,password:password,sessionInformation:sessionInformation,timestamp:timestamp,error:error];
}

@end
  
