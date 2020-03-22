#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUYaeiouy"];
    NSCharacterSet *consonants = [NSCharacterSet characterSetWithCharactersInString:@"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz"];
    NSCharacterSet *characterSetForSearch = [self isStringPangram:self] ? vowels : consonants;
    
    NSMutableArray *separatedString = [NSMutableArray arrayWithArray:[self componentsSeparatedByString:@" "]];
    NSMutableArray *resultArrayOfWords = [NSMutableArray array];
    
    for (NSString *currentWord in separatedString) {
        
        if (![currentWord isEqualToString:@""]) {
            
            NSMutableString *tempWord = [NSMutableString stringWithString:currentWord];
            int characterCounter = 0;
            NSRange range = NSMakeRange(0, 1);
            
            for (int i = 0; i < [currentWord length]; i++) {
                
                range.location = i;
                
                NSString *currentCharacter = [currentWord substringWithRange:range];
                
                if ([currentCharacter rangeOfCharacterFromSet:characterSetForSearch].location != NSNotFound) {
                    [tempWord replaceCharactersInRange:range withString:[currentCharacter uppercaseString]];
                    characterCounter++;
                }
            }
            [resultArrayOfWords addObject:[NSString stringWithFormat:@"%d%@", characterCounter, tempWord]];
        }
    }
    
    [resultArrayOfWords sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        NSString *word1 = (NSString *)obj1;
        NSString *word2 = (NSString *)obj2;
        
        NSRange firstCharacterRange = NSMakeRange(0, 1);
        int firstCharacterValue = [[word1 substringWithRange:firstCharacterRange] intValue];
        int secondCharacterValue = [[word2 substringWithRange:firstCharacterRange] intValue];
        
        if (firstCharacterValue < secondCharacterValue) {
            return NSOrderedAscending;
        } else if (firstCharacterValue == secondCharacterValue) {
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSString *result = [resultArrayOfWords componentsJoinedByString:@" "];
    
    return result;
}

- (BOOL)isStringPangram:(NSString *)string {
    
    NSArray *characters = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M",
                            @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    NSArray *values = @[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                      @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0];
    
    NSMutableDictionary *counterOfAlphaberCharacters = [[NSMutableDictionary alloc] initWithObjects:values forKeys:characters];
    NSCharacterSet *allLetters = [NSCharacterSet letterCharacterSet];
    NSRange range = NSMakeRange(0, 1);
    
    for (int i = 0; i < [string length]; i++) {
        
        range.location = i;
        NSString *currentCharacter = [[string substringWithRange:range] uppercaseString];
        
        if ([currentCharacter rangeOfCharacterFromSet:allLetters].location != NSNotFound) {
            
            int newCounterValueOfCurrentCharacter = [[counterOfAlphaberCharacters objectForKey:currentCharacter] intValue] + 1;
            [counterOfAlphaberCharacters setObject:[NSNumber numberWithInt:newCounterValueOfCurrentCharacter] forKey:currentCharacter];
        }
    }
 
    for (NSNumber *currentNumber in [counterOfAlphaberCharacters allValues]) {
        
        if ([currentNumber intValue] == 0) {
            return NO;
        }
    }
    
    return YES;
}

@end
