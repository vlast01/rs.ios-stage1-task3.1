#import "Combinator.h"

@implementation Combinator

- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    
    int c = [[array objectAtIndex:0] intValue];
    int n = [[array objectAtIndex:1] intValue];
    int k = 1;
    
    
    while (true) {
        long topFactorial = 1  ;
        for (int i = 0; i < n; i++) {
            topFactorial *= i+1;
        }
        
        long bottomFactorial1 = 1;
        for (int i = 0; i < n - k; i++) {
            bottomFactorial1 *= i+1;
        }
        
        long bottomFactorial2 = 1;
        for(int i = 0; i < k; i++){
            bottomFactorial2 *= i+1;
        }
        
        if (c == topFactorial/(bottomFactorial1*bottomFactorial2)){
            return @(k);
        }
        
        if (k>n) {
            return nil;
        }
        
        k++;
    }
    
    return @0;
}
@end
