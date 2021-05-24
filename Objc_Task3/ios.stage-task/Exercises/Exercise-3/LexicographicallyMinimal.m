#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *result = [[NSMutableString alloc] init];
    NSInteger left = 0;
    NSInteger right = 0;
    NSMutableString *leftChar;
    NSMutableString *rightChar;
    
    while (left < string1.length && right < string2.length) {
        NSString *min;
        if (leftChar == nil) {
            leftChar = [NSMutableString stringWithString:[string1 substringWithRange:NSMakeRange(left, 1)]];
        }
        if (rightChar == nil) {
            rightChar = [NSMutableString stringWithString:[string2 substringWithRange:NSMakeRange(right, 1)]];
        }
        if ([rightChar compare: leftChar] == NSOrderedAscending) {
            min = rightChar;
            rightChar = nil;
            right++;
        } else {
            min = leftChar;
            leftChar = nil;
            left++;
        }
        [result appendString:min];
    }
    
    if (left < string1.length) {
        [result appendString:[string1 substringFromIndex:left]];
    } else {
        [result appendString:[string2 substringFromIndex:right]];
    }
    
    return result;
}

@end
