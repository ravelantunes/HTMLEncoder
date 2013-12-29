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

/*!
 Method use to build an string from the properties.
 Deprecated in fovor of toString, as it is a more descriptive method name.
 */
- (NSString*)styleToString __attribute((deprecated("use toString method")));

/*!
 Method use to build an string from the properties.
 */
- (NSString*)toString;

@end
