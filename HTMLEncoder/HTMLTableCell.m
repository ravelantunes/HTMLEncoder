//
//  HTMLTableCell.m
//
//  Created by Ravel Antunes on 1/29/13.
//
//  Created by Ravel Antunes on 1/31/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import "HTMLTableCell.h"


@interface HTMLTableCell ()

@end


@implementation HTMLTableCell

@synthesize columnSpan = _columnSpan;
@synthesize rowSpan = _rowSpan;


- (id)init{
    return self = [super initWithTag:@"td"];
}

- (void)setRowSpan:(int)rowSpan{
    if (rowSpan > 1) {
        _rowSpan = rowSpan;
    }
}

- (int)rowSpan{
    return _rowSpan;
}

- (void)setColumnSpan:(int)columnSpan{
    if (columnSpan > 1) {
        _columnSpan = columnSpan;
    }
}

- (int)columnSpan{
    return _columnSpan;
}


- (NSString*)domObject{
    
    NSString *rowSpanString = (_rowSpan > 1) ? [NSString stringWithFormat:@" rowSpan=\"%d\"", _rowSpan] : @"";
    
    NSString *colSpanString = (_columnSpan > 1) ? [NSString stringWithFormat:@" colSpan=\"%d\"", _columnSpan] : @"";
    
    return [NSString stringWithFormat:@"<%@%@%@%@%@>%@</%@>", self.htmlTag, self.classesToString, [self styleToString], rowSpanString, colSpanString, self.content, self.htmlTag];
}


@end
