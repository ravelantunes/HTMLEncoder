//
//  HTMLTableRow.m
//
//  Created by Ravel Antunes on 1/31/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import "HTMLTable.h"

@interface HTMLTable (){
    NSMutableArray *_rows;
}

@end

@implementation HTMLTable


- (id)init{
   return self = [super initWithTag:@"table"];
}

- (void)setContent:(NSString *)content{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"Cannot set content directly, content needs to be set through child nodes."                               userInfo:nil];
}

- (NSString*)content{
    return [self childrensToString];
}


- (NSString*)domObject{
    return [NSString stringWithFormat:@"<%@%@%@>%@</%@>", self.htmlTag, self.classesToString, self.styleToString, self.content, self.htmlTag];
}

@end
