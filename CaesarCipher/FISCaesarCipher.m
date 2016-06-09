//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here


-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key {

    
    NSString *encodedMessage = @"";
    for (NSUInteger i = 0; i< [message length]; i++)
    {
        unichar letter = [message characterAtIndex:i];
        NSUInteger offset = key % 26;
        if (letter == 0x20) //letter == 32 its a space
        {
            //encodedMessage = [encodedMessage stringByAppendingString:@" "];
            
        }
        else if ( (letter >= 33 && letter <= 47)) //its a punctuation mark or symbol
        {
//            NSString *letterString = [NSString stringWithFormat:@"%C", letter];
//            encodedMessage = [encodedMessage stringByAppendingString:letterString];

        }
        else if (letter > 65 && letter < 91) // uppercase string
        {
            letter += offset;
            if (letter > 90)
            {
                unichar aboveUpperCaseLetter = letter % 91;
                aboveUpperCaseLetter +=65;
                letter = aboveUpperCaseLetter;
            }
        }
        
        
        else if (letter > 96 && letter < 123)
        {
            letter += offset;
            if (letter > 122) {
                unichar aboveLowercaseLetter = letter % 123;
                aboveLowercaseLetter +=97;
                letter = aboveLowercaseLetter;
            }
        }
        NSString *letterString = [NSString stringWithFormat:@"%C", letter];
        encodedMessage = [encodedMessage stringByAppendingString:letterString];
    }
    
    //go back and do unichar
/*    
    NSArray *uppercaseLetters = @[@"A", @"B",@"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    NSArray *lowercaseLetters = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
        
        
    NSString *encodedMessage = @"";
    for (NSUInteger i = 0; i< [message length]; i++)
    {
        unichar letter = [message characterAtIndex:i];
        NSString *letterString = [NSString stringWithFormat:@"%C", letter]; // convert unichar to string
        BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[message characterAtIndex:i]];
        if (isUppercase)
        {
            for (NSUInteger j = 0; j < [uppercaseLetters count]; j++)
            {
                if ([uppercaseLetters[j] isEqualToString:letterString])
                {
                    NSInteger index = j;
                    index = (index + key) % 26;
                    encodedMessage = [encodedMessage stringByAppendingString:uppercaseLetters[index]];
                }
            }
        }else {
            for (NSUInteger k = 0; k < [lowercaseLetters count]; k++)
            {
                if ([lowercaseLetters[k] isEqualToString:letterString])
                {
                    NSInteger index = k;
                    index = (index + key) % 26;
                    encodedMessage = [encodedMessage stringByAppendingString:lowercaseLetters[index]];

                }
            }
        }
        
    }
*/

    return encodedMessage;
}
-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key {
    
    NSString *decodedMessage = @"";
    for (NSUInteger i = 0; i< [encodedMessage length]; i++)
    {
        unichar letter = [encodedMessage characterAtIndex:i];
        NSUInteger offset = key % 26;
        if (letter > 65 && letter < 91) // uppercase string
        {
            letter -= offset;
            if (letter < 65)
            {
                NSInteger remainderOf = letter - 65;
                letter = 91 + remainderOf;
            }
        }else if (letter > 96 && letter < 123) //lowercase
        {
            letter -= offset;
            if (letter < 97)
            {
                NSInteger remainderOf = letter - 97;
                letter = 123 + remainderOf;
            }
        }
     
        NSString *letterString = [NSString stringWithFormat:@"%C", letter];
        decodedMessage = [decodedMessage stringByAppendingString:letterString];
    }
    
    return decodedMessage;
}

@end
