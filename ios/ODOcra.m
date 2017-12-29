
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
    
    NSString *timeStampHex = nil;
    long timeStampLong = 0;
    
    // 1. Get timestamp or convert given value to long
    if (timeStamp.length==0) {
        timeStampLong = (long)(NSTimeInterval)([[NSDate date] timeIntervalSince1970]);
    } else {
        timeStampLong = [timeStamp longLongValue];
    }
    
    // 2. Round timestamp value
    long timeStampRounded = [self getTimeReference:timeStampLong];
    // 3. Convert timestamp to hex
    timeStampHex = [NSString stringWithFormat:@"0x%lX", timeStampRounded];
    
    // Key needs to be converted to hex
    NSString *ocraKey = [self hexFromString:key];
    
    //Do some stuff
    NSError *error;
    
    NSString *ocra = [OCRA generateOCRAForSuite:ocraSuite key:ocraKey counter:counter question:question password:password sessionInformation:sessionInformation timestamp:timeStampHex error:&error];
    
    if (error!=nil){
        reject(@"OcraSDK", error.localizedDescription, error);
    } else {
        resolve(ocra);
    }
}

- (long)getTimeReference:(long)timeStamp
{
    long roundingFactor = 1000 * 60 * 5;
    return timeStamp/roundingFactor;
}

- (NSString *)hexFromString:(NSString *)str
{
    NSUInteger len = [str length];
    unichar *chars = malloc(len * sizeof(unichar));
    [str getCharacters:chars];
    
    NSMutableString *hexString = [[NSMutableString alloc] init];
    
    for(NSUInteger i = 0; i < len; i++ )
    {
        // [hexString [NSString stringWithFormat:@"%02x", chars[i]]]; /*previous input*/
        [hexString appendFormat:@"%02x", chars[i]]; /*EDITED PER COMMENT BELOW*/
    }
    free(chars);
    
    return hexString;
}

@end
