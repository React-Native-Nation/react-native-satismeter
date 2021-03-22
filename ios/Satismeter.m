/// jamesjara
#import "Satismeter.h"
#import "RCTLog.h"
#import "SatisMeter/SatisMeter.h"

@implementation Satismeter

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(hook, 
    userId:(nonnull NSString *)userId 
    writeKey:(nonnull NSString *)writeKey
    traits:(NSDictionary *)traits
    callback:(RCTResponseSenderBlock)callback)
{
    callback(@[[NSString stringWithFormat: @"userId: %@ writeKey: %@", userId, writeKey]]);
    
    [[SatisMeter sharedInstance] identifyUserWithUserId: userId
                                               writeKey: writeKey
                                    andTraitsDictionary: traits];

}

@end