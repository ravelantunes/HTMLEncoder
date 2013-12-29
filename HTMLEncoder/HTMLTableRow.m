//
//  HTMLTableCell.m
//
//  Created by Ravel Antunes on 1/31/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import "HTMLTableRow.h"

@implementation HTMLTableRow

- (id)init{
    return self = [super initWithTag:@"tr"];
}


- (void)setContent:(NSString *)content{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"Cannot set content directly, content needs to be set through child nodes."                               userInfo:nil];
}

- (NSString*)content{
    return [self childrensToString];
}

- (NSString*)toString{    
    return [NSString stringWithFormat:@"<%@%@%@>%@</%@>", self.htmlTag, self.classesToString, self.styleToString, self.content, self.htmlTag];
}


@end
