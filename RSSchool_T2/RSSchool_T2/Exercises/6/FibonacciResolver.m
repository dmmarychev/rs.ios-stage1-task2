#import "FibonacciResolver.h"

@implementation FibonacciResolver

- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    int intValueOfNumber = [number intValue];
    
    NSMutableArray *fibonacciNumbers = [NSMutableArray arrayWithObjects:@0, @1, nil];
    
    while (YES) {

        NSNumber *penultimateFibonacciNumber = fibonacciNumbers[[fibonacciNumbers count] - 2];
        NSNumber *lastFibonacciNumber = [fibonacciNumbers lastObject];
        
        int productOfNumbers = [lastFibonacciNumber intValue] * [penultimateFibonacciNumber intValue];
        int sumOfNumbers = [lastFibonacciNumber intValue] + [penultimateFibonacciNumber intValue];
        
        if (productOfNumbers < intValueOfNumber) {
            
            [fibonacciNumbers addObject:[NSNumber numberWithInt:sumOfNumbers]];
            
        } else {
            return @[penultimateFibonacciNumber, lastFibonacciNumber, intValueOfNumber == productOfNumbers ? @1 : @0];
        }
    }
    return @[];
}

@end
