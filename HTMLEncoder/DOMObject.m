//
//  DOMObject.m
//  HTMLEncoder
//
//  Created by Ravel Antunes on 1/30/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import "DOMObject.h"
#import "CSSStyle.h"

@interface DOMObject (){
    NSMutableSet *_classes;
    NSMutableArray *_childNodes;
}

@end

@implementation DOMObject


@synthesize content = _content;
@synthesize htmlTag = _htmlTag;
@synthesize style = _style;


#pragma mark -
#pragma mark Initializer methods

//This init method should not be called.
//It needs to have a html tag
- (id)init{
    @throw [NSException exceptionWithName:@"Invalid Method Call" reason:@"Init method should not be used. Use initWithTag:" userInfo:nil];
}

- (id)initWithTag:(NSString *)tag{
    self = [super init];
    if (self) {
        
        _htmlTag = tag;
        
    }
    return self;
}



#pragma mark -
#pragma mark Children Nodes Methods

/**
 Methods to add subclasses of DOMObjects to self
 */


- (void)addChild:(DOMObject*)domObject{
    
    if (!_childNodes) {
        _childNodes = [[NSMutableArray alloc] init];
    }
    
    [_childNodes addObject:domObject];
    
}
- (void)addChildrens:(DOMObject*)domObject,... NS_REQUIRES_NIL_TERMINATION{
    
    va_list args;
    va_start(args, domObject);
    
    for (DOMObject *dom = domObject; dom != nil; dom = va_arg(args, DOMObject*)) {
        [self addChild:domObject];
    }
    
}

- (NSString*)childrensToString{
    
    if (![_childNodes count]) {
        return @"";
    }
    
    NSMutableString *childrenString = [[NSMutableString alloc] init];
    for (DOMObject *child in _childNodes) {
        [childrenString appendString:[child domObject]];
    }
    
    return childrenString;
}


#pragma mark -
#pragma mark CSS Classes Methods

/**
 Methods to assign classes to the DOMObject object, and that will be inherited by the other
 DOM objects extending this class.
 */
- (void)addClass:(NSString*)cssClass{
    
    //Checks if the classes array was already initialized
    if (!_classes) {
        _classes = [[NSMutableSet alloc] init];
    }
    
    //Adds a class to the array
    [_classes addObject:cssClass];
    
}

- (void)addClasses:(NSString*)cssClass,... NS_REQUIRES_NIL_TERMINATION{
    
    //Checks if the classes array was already initialized
    if (!_classes) {
        _classes = [[NSMutableSet alloc] init];
    }
    
    va_list args;
    va_start(args, cssClass);
    
    //Iterates through all args
    for (NSString *c = cssClass; c != nil; c = va_arg(args, NSString*)) {
        [_classes addObject:c];
    }
    
}
- (void)setClasses:(NSString*)cssClass,... NS_REQUIRES_NIL_TERMINATION{
    
    //Checks if the classes array was already initialized
    if (!_classes) {
        _classes = [[NSMutableSet alloc] init];
    }
    
    va_list args;
    va_start(args, cssClass);
    
    //Iterates through all args
    for (NSString *c = cssClass; c != nil; c = va_arg(args, NSString*)) {
        [_classes addObject:c];
    }
    
}


/**
 This method will return a string with how the classes should be added to
 a DOM object. For an instance, if the DOMObject contains two CSSClass
 objects (CSSClass *class1, CSSClass *class2) in the _class array, the 
 string returned would be: style="class, class2"
 */
- (NSString*)classesToString{
    
    if (![_classes count]) {
        //If there are no classes, returns empty string
        return @"";
    }
    
    NSArray *classes = [_classes allObjects];
    
    //Initializes the string with style="{first class}   <--(Starts with an empty space)
    NSMutableString *classesString = [[NSMutableString alloc] initWithFormat:@" class=\"%@", [classes objectAtIndex:0]];
    
    //Appends the rest of the classes (if any), followed by comma an space
    for (int i = 1; i < [_classes count]; i++) {
        [classesString appendFormat:@", %@", [classes objectAtIndex:i]];
    }
    
    //Closes style double quotes
    [classesString appendString:@"\""];
    
    return classesString;
}



- (NSString*)styleToString{
    
    //Returns empty string to be safe that (null) won't be printed
    if (!self.style) {
        return @"";
    }
    
    return [_style styleToString];
}


- (NSString*)domObject{
    return [NSString stringWithFormat:@"<%@%@%@>%@</%@>", self.htmlTag, self.classesToString, self.styleToString, self.content, self.htmlTag];

}

@end
