
#import "ODOcra.h"
#import "OCRA.h"

@implementation ODOcra RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(generateOcra:(NSString*) ocraSuite
                  key:(NSString*) key
                  counter:(NSString*) counter
                  question:(NSString*) question
                  password:(NSString*) password
                  sessionInformation:(NSString*) sessionInformation
                  timestamp:(NSString*) timeStamp
                  resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    
    //Do some stuff
    NSError *error;
   
    NSString *ocra = [OCRA generateOCRAForSuite:ocraSuite key:key counter:counter question:question password:password sessionInformation:sessionInformation timestamp:timeStamp error:&error];
    
    if(error!=nil){
         reject(@"OcraSDK", error.localizedDescription, error);
    }else{
        resolve(ocra);
    }
}



@end
  
