//
//  HTMLTableHeader.m
//  HTMLEncoder
//
//  Created by Ravel Antunes on 1/31/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import "HTMLTableHeader.h"

@implementation HTMLTableHeader

- (NSString*)toString{
    
    NSString *rowSpanString = (_rowSpan > 1) ? [NSString stringWithFormat:@" rowSpan=\"%d\"", _rowSpan] : @"";
    
    NSString *colSpanString = (_columnSpan > 1) ? [NSString stringWithFormat:@" colSpan=\"%d\"", _columnSpan] : @"";
    
    return [NSString stringWithFormat:@"<%@%@%@%@%@>%@</%@>", self.htmlTag, self.classesToString, [self styleToString], rowSpanString, colSpanString, self.content, self.htmlTag];
}

@end
