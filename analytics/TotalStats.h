#import <Foundation/Foundation.h>

@interface TotalStats : NSObject

- (instancetype) initWithAttributes:(NSDictionary *)info;

@property NSNumber *downloadCount;
@property NSNumber *hitCount;
@property NSNumber *sentCount;
@property NSNumber *registrationCount;
@property NSString *percentConverted;
@property NSString *percentConvertedSMS;
@property NSString *percentConvertedEmail;
@end

