#import <Foundation/Foundation.h>

typedef void (^BlockA)(NSArray *);
typedef void (^BlockB)(Class);
typedef void (^BlockC)(NSObject *result);

@interface Blocks : NSObject

@property (nonatomic) BlockA blockA;
@property (nonatomic) BlockB blockB;
@property (nonatomic) BlockC blockC;

@end
