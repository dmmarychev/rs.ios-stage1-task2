#import <Foundation/Foundation.h>

typedef void (^BlockA)(NSArray *);
typedef void (^BlockB)(Class);
typedef void (^BlockC)(NSObject *result);

@interface Blocks : NSObject

@property (copy, nonatomic) BlockA blockA;
@property (copy, nonatomic) BlockB blockB;
@property (copy, nonatomic) BlockC blockC;

@end
