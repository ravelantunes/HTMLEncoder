//
//  HTMLTableEncoderTest.m
//  HTMLTableEncoderTest
//
//  Created by Ravel Antunes on 1/30/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import "HTMLTableEncoderTest.h"
#import "HTMLTableCell.h"
#import "HTMLTableRow.h"
#import "HTMLTable.h"
#import "CSSStyle.h"

@interface HTMLTableEncoderTest (){
    NSMutableArray *cells;
}

@end

@implementation HTMLTableEncoderTest

- (void)setUp
{
    [super setUp];
    
    cells = [[NSMutableArray alloc] init];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testCreateTable{
    
    HTMLTableCell *cell1 = [[HTMLTableCell alloc] init];
    [cell1 setContent:@"Cell Text"];
    [cell1 setClasses:@"Class1", @"Class2", nil];
    [cell1 addClass:@"Class3"];
    [cell1 addClasses:@"Class4", @"Class5", nil];
    [cell1 setColumnSpan:1];
    [cell1 setRowSpan:1];
    
    CSSStyle *css = [[CSSStyle alloc] init];
    [css setColor:@"red"];
    [css setBackgroundColor:@"blue"];
    [css setWidth:@"200px"];
    [cell1 setStyle:css];
    
    HTMLTableRow *row1 = [[HTMLTableRow alloc] init];
    [row1 addChild:cell1];
    
    HTMLTable *table1 = [[HTMLTable alloc] init];
    [table1 addChild:row1];
    
    //    NSLog(@"Test: %@", row1.childrensToString);
    NSLog(@"Row html: %@", table1.domObject);
    
    NSString *expectedString = @"<table><tr><td class=\"Class3, Class4, Class1, Class5, Class2\" style=\"color: red; background-color: blue; width: 200px; \">Cell Text</td></tr></table>";
    
    STAssertTrue([expectedString isEqualToString:table1.domObject], @"String result is not correct.");
    
    
    
}

@end
