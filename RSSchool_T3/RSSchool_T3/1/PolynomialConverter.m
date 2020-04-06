#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    NSInteger length = [numbers count];
    
    if (length == 0) {
        return nil;
    }
    
    for (int i = 0; i < length; i++) {
        
        if (i==0 && [[numbers objectAtIndex:i]intValue]<0) {
            [result appendString:@"-"];
        }
        
        int coefficient = [[numbers objectAtIndex:i] intValue];
        
        if (coefficient == 0) {
            continue;
        }
        
        if (i != 0) {
            if (coefficient>0) {
                [result appendString:@" + "];
            }
            else [result appendString:@" - "];
        }
        
        if (coefficient != 1 && coefficient != -1) {
            [result appendString:[NSString stringWithFormat:@"%d", abs(coefficient)]];
        }
        
        if (i == length-2) {
            [result appendString:@"x"];
            continue;
        }
        
        if (i == length-1) {
            break;
        }
        [result appendString:[NSString stringWithFormat:@"x^%ld", length-i-1]];
    }
    
    return result;
}
@end
