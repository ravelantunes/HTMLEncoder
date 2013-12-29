//
//  CSSStyle.m
//  HTMLEncoder
//
//  Created by Ravel Antunes on 1/30/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import "CSSStyle.h"

@implementation CSSStyle

@synthesize color = _color;
@synthesize backgroundColor = _backgroundColor;
@synthesize width = _width;
@synthesize height = _height;

- (NSString*)toString{

    int attributesCounter = 0;
    NSMutableString *styleString = [[NSMutableString alloc] initWithString:@" style=\""];
    
    if ([_color length]) {
        [styleString appendFormat:@"color: %@; ", _color];
        attributesCounter++;
    }
    
    if ([_backgroundColor length]) {
        [styleString appendFormat:@"background-color: %@; ", _backgroundColor];
        attributesCounter++;
    }

    if (_width) {
        [styleString appendFormat:@"width: %@; ", _width];
        attributesCounter++;
    }
    
    if (_height) {
        [styleString appendFormat:@"height: %@; ", _height];
        attributesCounter++;
    }
    
    if (_textAlign) {
        [styleString appendFormat:@"text-align: %@; ", _textAlign];
        attributesCounter++;
    }
    
    //Check if had any attribute
    if (!attributesCounter) {
        return @"";
    }
    
    
    [styleString appendString:@"\""];
    
    return styleString;
}


- (NSString *)styleToString{
    return [self toString];
}

@end
