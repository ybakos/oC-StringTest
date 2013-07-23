//
//  main.m
//  StringTest
//
//  Created by Yong Bakos on 11/27/11.
//  Copyright (c) 2011 Human-Oriented Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * Chomp the newline character
 */
@interface NSString (chomp)
-(NSString *) chomp;
@end
@implementation NSString (chomp)
-(NSString *) chomp {
    return [self substringToIndex:[self length] - 1];
}
@end


NSString* cin(void);
void cout(NSString*);

int main (int argc, const char * argv[]) {
    @autoreleasepool {
        NSString* text = cin();
        text = [text chomp];
        cout(text);
    }
    return 0;
}


/*
 *  Reading a string from stdin
 */
NSString* cin(void) {
    @autoreleasepool {
        // Instantiate NSData object using data from stdin
        NSData* input = [[NSFileHandle fileHandleWithStandardInput] availableData];
        // Initialize NSString with NSData
        NSString *name = [[NSString alloc] initWithData:input encoding:NSUTF8StringEncoding];
        return name;
    }
}

/*
 *  Writing a string to stdout.
 */
void cout(NSString* s) {
    @autoreleasepool {
        // Convert NSString to NSData
        NSData* outData = [s dataUsingEncoding:NSUTF8StringEncoding];
        // Instantiate an NSFileHandle whose target is stdout
        NSFileHandle* output = [NSFileHandle fileHandleWithStandardOutput];
        
        [output writeData: outData];
    }
}
