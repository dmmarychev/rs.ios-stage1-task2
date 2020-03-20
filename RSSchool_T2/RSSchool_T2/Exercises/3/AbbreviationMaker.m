#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSString *uppercasedStringA = [a uppercaseString];
    NSArray *charactersA = [self splitStringToArrayOfCharacters:uppercasedStringA];
    NSArray *charactersB = [self splitStringToArrayOfCharacters:b];
    NSString *result = @"";
    
    int indexOfCharacterToCheckInB = 0;
    
    for (int i = 0; i < [charactersA count]; i++) {
        
        if (indexOfCharacterToCheckInB < [charactersB count]) {
            
            NSString *currentCharacterA = [charactersA objectAtIndex:i];
            NSString *currentCharacterB = [charactersB objectAtIndex:indexOfCharacterToCheckInB];
            
            if ([currentCharacterA isEqualToString:currentCharacterB]) {
                result = [result stringByAppendingString:currentCharacterB];
                indexOfCharacterToCheckInB++;
            }
        }
    }
    
    if ([result isEqualToString:b]) {
        return @"YES";
    } else {
        return @"NO";
    }
}

- (NSArray *)splitStringToArrayOfCharacters: (NSString *)string {
    
    NSMutableArray *result = [NSMutableArray array];
    NSRange range = NSMakeRange(0, 1);
    
    for (int i = 0; i < [string length]; i++) {
        
        range.location = i;
        [result addObject:[string substringWithRange:range]];
    }
    
    return result;
}



@end
