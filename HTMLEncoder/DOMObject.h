//
//  DOMObject.h
//  HTMLEncoder
//
//  Created by Ravel Antunes on 1/30/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSSStyle;

@interface DOMObject : NSObject

@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic, readonly) NSString *htmlTag;
@property (strong, nonatomic) CSSStyle *style;


//Initializer
- (id)initWithTag:(NSString*)tag;


//Child nodes
- (void)addChild:(DOMObject*)domObject;
- (void)addChildrens:(DOMObject*)domObject,... NS_REQUIRES_NIL_TERMINATION;
- (NSString*)childrensToString;

//Set classes
- (void)addClass:(NSString*)cssClass;
- (void)addClasses:(NSString*)cssClass,... NS_REQUIRES_NIL_TERMINATION;
- (void)setClasses:(NSString*)cssClass,... NS_REQUIRES_NIL_TERMINATION;

//Get classes
- (NSString*)classesToString;

//Style method
- (NSString*)styleToString;

//Abstract method to return self as a DOM Object string
- (NSString*)domObject;

@end
