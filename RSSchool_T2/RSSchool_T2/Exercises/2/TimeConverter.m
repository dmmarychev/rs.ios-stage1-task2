#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    int hoursValue = [hours intValue];
    int minutesValue = [minutes intValue];
    
    if (hoursValue < 0 || hoursValue > 12 || minutesValue < 0 || minutesValue > 59) {
        return @"";
    }

    NSDictionary * minutesAndHours = @{@"1" : @"one", @"2" : @"two", @"3" : @"three", @"4" : @"four", @"5" : @"five",
                                       @"6" : @"six", @"7" : @"seven", @"8" : @"eight", @"9" : @"nine", @"10" : @"ten",
                                       @"11" : @"eleven", @"12" : @"twelve", @"13" : @"thirteen", @"14" : @"fourteen", @"15" : @"fifteen",
                                       @"16" : @"sixteen", @"17" : @"seventeen", @"18" : @"eighteen", @"19" : @"nineteen", @"20" : @"twenty",
                                       @"21" : @"twenty one", @"22" : @"twenty two", @"23" : @"twenty three", @"24" : @"twenty four",
                                       @"25" : @"twenty five", @"26" : @"twenty six", @"27" : @"twenty seven", @"28" : @"twenty eight",
                                       @"29" : @"twenty nine"};
    
    if (minutesValue == 0) {
        
        return [NSString stringWithFormat:@"%@ o' clock", [minutesAndHours valueForKey:hours]];
        
    } else if (minutesValue <= 30) {
        
        if (minutesValue == 15) {
            
            return [NSString stringWithFormat:@"quarter past %@", [minutesAndHours valueForKey:hours]];
            
        } else if (minutesValue == 30) {
           
            return [NSString stringWithFormat:@"half past %@", [minutesAndHours valueForKey:hours]];
            
        } else {
            
            NSString *minuteOrMinutes = minutesValue < 1 ? @"minute" : @"minutes";
            NSString *minutesWithoutZero = [NSString stringWithFormat:@"%d", [minutes intValue]];
            return  [NSString stringWithFormat:@"%@ %@ past %@", [minutesAndHours valueForKey:minutesWithoutZero], minuteOrMinutes, [minutesAndHours valueForKey:hours]];
        }
    } else {
        
        NSString *nextHour = [NSString stringWithFormat:@"%d", hoursValue + 1];
        
        if (minutesValue == 45) {

            return [NSString stringWithFormat:@"quarter to %@", [minutesAndHours valueForKey:nextHour]];
            
        } else {
            
            NSString *minutesToNextHour = [NSString stringWithFormat:@"%d", 60 - minutesValue];
            return [NSString stringWithFormat:@"%@ minutes to %@", [minutesAndHours valueForKey:minutesToNextHour], [minutesAndHours valueForKey:nextHour]];
        }
    }
}

@end
