//
//  HTMLTableCell.h
//
//  Created by Ravel Antunes on 1/31/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOMObject.h"



@class CSSClass;

@interface HTMLTableCell : DOMObject

@property int columnSpan;
@property int rowSpan;


@end
