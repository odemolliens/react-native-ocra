
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
    if(counter.length==0){
        counter = nil;
    }
    
    if(password.length==0){
        password = nil;
    }
    
    if(sessionInformation.length==0){
        sessionInformation = nil;
    }
    
    if(timeStamp.length==0){
        timeStamp = [ODOcra getTimeReference];
    }

    //Do some stuff
    NSError *error;
   
    NSString *ocra = [OCRA generateOCRAForSuite:ocraSuite key:key counter:counter question:question password:password sessionInformation:sessionInformation timestamp:timeStamp error:&error];
    
    if(error!=nil){
         reject(@"OcraSDK", error.localizedDescription, error);
    }else{
        resolve(ocra);
    }
    
}

+(NSString*)getTimeReference{
    
    long timeStamp = [[NSDate date] timeIntervalSince1970];
    long roundingFactor = 1000 * 60 * 5;
    return [NSString stringWithFormat:@"%lu",(timeStamp/roundingFactor)];
}





@end
  
