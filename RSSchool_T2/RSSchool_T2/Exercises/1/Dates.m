#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = [year integerValue];
    components.month = [month integerValue];
    components.day = [day integerValue];
    
    if ([components isValidDateInCalendar:calendar]) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        dateFormatter.dateFormat = @"dd MMMM, EEEE";
        
        NSDate *currentDate = [calendar dateFromComponents:components];
        
        return [dateFormatter stringFromDate:currentDate];
    } else {
        return @"Такого дня не существует";
    }

}

@end
