// BackgroundTaskManager.m
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_REMAP_MODULE(BackgroundTaskManager, BackgroundTaskManager, NSObject)

RCT_EXTERN_METHOD(registerBackgroundTask:(NSString *)taskIdentifier
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

@end
