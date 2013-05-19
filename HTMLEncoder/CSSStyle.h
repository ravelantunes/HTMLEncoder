//
//  CSSStyle.h
//  HTMLEncoder
//
//  Created by Ravel Antunes on 1/30/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSSStyle : NSObject

//Color
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *backgroundColor;

//Size
@property (strong, nonatomic) NSString *width;
@property (strong, nonatomic) NSString *height;

//Text/Font
@property (strong, nonatomic) NSString *textAlign;

- (NSString*)styleToString;

@end
