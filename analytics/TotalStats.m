#import "TotalStats.h"

@implementation TotalStats

- (instancetype) initWithAttributes:(NSDictionary *)info{
    self = [super init];
    
    if (self){
        
        self.downloadCount =  [NSNumber numberWithInt:[[info valueForKeyPath:@"downloads"] intValue]];
        self.hitCount =  [NSNumber numberWithInt:[[info valueForKeyPath:@"hits"] intValue]];
        self.registrationCount =  [NSNumber numberWithInt:[[info valueForKeyPath:@"registrations"] intValue]];
        self.sentCount =  [NSNumber numberWithInt:[[info valueForKeyPath:@"total_sent"] intValue]];
        self.percentConverted = [info valueForKeyPath:@"percent_converted"];
        self.percentConvertedSMS = [info valueForKeyPath:@"percent_converted_email"];
        self.percentConvertedEmail = [info valueForKeyPath:@"percent_converted_sms"];
    }
    return self;
}

@end
