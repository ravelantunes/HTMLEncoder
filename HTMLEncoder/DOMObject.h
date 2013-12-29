//
//  DOMObject.h
//  HTMLEncoder
//
//  Created by Ravel Antunes on 1/30/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSSStyle;

/*!
 The main class to be used as a base class for all other dom object classes.
 It will usually be subclassed to perform a more strong type implementation of
 other objects, like HTMLTable and HTMLTableRow. In case some dom objects are
 not yet implemented, one can initialize this object with initWithTag: method,
 passing the desired tag as a string.
 */
@interface DOMObject : NSObject

@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic, readonly) NSString *htmlTag;
@property (strong, nonatomic) CSSStyle *style;


/*!
 Use this method to initialize the object with the desired html tag.
 
 @param tag The tag that will be used for the object. Ex.: passing "h2" will generate
 a <h2></h2> tag.
 
 @return An initialized dom object with the tag received on the string param.
 */
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


/*!
 Method to return the string representation of the dom object.
 Deprecated in favor to toString as a more descriptive method name.
 */
- (NSString*)domObject __attribute((deprecated("use toString method instead")));

/*!
 Method to return the string representation of the dom object.
 */
- (NSString*)toString;


@end
