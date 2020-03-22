#import "Blocks.h"

@interface Blocks ()

@property (strong, nonatomic) __block NSArray *array;

@end

@implementation Blocks

#pragma mark - Init & dealloc

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configurateBlocks];
    }
    return self;
}


#pragma mark - Blocks

- (void)configurateBlocks {
    
    self.blockA = ^(NSArray *array) {
        self.array = array;
    };
    
    self.blockB = ^(Class class) {
        
        NSMutableArray *objectsOfCurrentClass = [NSMutableArray array];
        
        for (NSObject *currentObject in self.array) {
            
            if ([currentObject isKindOfClass:class] && currentObject != NULL && currentObject != nil) {
                [objectsOfCurrentClass addObject:currentObject];
            }
        }
        
        if ([objectsOfCurrentClass count] > 1) {
            
            if (class == [NSString class]) {
                
                self.blockC([objectsOfCurrentClass componentsJoinedByString:@""]);
                
            } else if (class == [NSNumber class]) {
                
                int sum = 0;
                
                for (NSNumber *currentNumber in objectsOfCurrentClass) {
                    sum += [currentNumber intValue];
                }
                
                self.blockC([NSNumber numberWithInt:sum]);
                
            } else if (class == [NSDate class]){
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"dd.MM.yyyy";
                
                NSDate *resultDate = [objectsOfCurrentClass firstObject];
                
                for (NSDate *currentDate in objectsOfCurrentClass) {
                    
                    resultDate = [currentDate laterDate:resultDate];
                }
                
                self.blockC([formatter stringFromDate:resultDate]);
            }
        }
    };
}

@end
