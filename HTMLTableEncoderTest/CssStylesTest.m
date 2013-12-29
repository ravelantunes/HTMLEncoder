//
//  CssStylesTest.m
//  HTMLEncoder
//
//  Created by Ravel Antunes on 12/29/13.
//  Copyright (c) 2013 Ravel Antunes. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "CSSStyle.h"

@interface CssStylesTest : SenTestCase

@end

@implementation CssStylesTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}



- (void)testColor{
    
    CSSStyle *style = [[CSSStyle alloc] init];
    style.color = @"red";
    
    NSString *expectedString = @" style=\"color: red; \"";
    STAssertTrue([expectedString isEqualToString:[style toString]], @"Expected %@, got %@", expectedString, [style toString]);

}

- (void)testBackgroundColor{
    CSSStyle *style = [[CSSStyle alloc] init];
    style.backgroundColor = @"red";
    
    NSString *expectedString = @" style=\"background-color: red; \"";
    STAssertTrue([expectedString isEqualToString:[style toString]], @"Expected %@, got %@", expectedString, [style toString]);
}

- (void)testWidth{
    CSSStyle *style = [[CSSStyle alloc] init];
    style.width = @"300px";
    
    NSString *expectedString = @" style=\"width: 300px; \"";
    STAssertTrue([expectedString isEqualToString:[style toString]], @"Expected %@, got %@", expectedString, [style toString]);
}

- (void)testHeight{
    CSSStyle *style = [[CSSStyle alloc] init];
    style.height = @"200px";
    
    NSString *expectedString = @" style=\"height: 200px; \"";
    STAssertTrue([expectedString isEqualToString:[style toString]], @"Expected %@, got %@", expectedString, [style toString]);
}

- (void)testTextAlign{
    CSSStyle *style = [[CSSStyle alloc] init];
    style.textAlign = @"center";
    
    NSString *expectedString = @" style=\"text-align: center; \"";
    STAssertTrue([expectedString isEqualToString:[style toString]], @"Expected %@, got %@", expectedString, [style toString]);
}

- (void)testCustomCssProperty{
    CSSStyle *style = [[CSSStyle alloc] init];
    [style addCustomProperty:@"box-shadow" withValue:@"10px 10px 5px #888888"];
    
    NSString *expectedString = @" style=\"box-shadow: 10px 10px 5px #888888;\"";
    STAssertTrue([expectedString isEqualToString:[style toString]], @"Expected %@, got %@", expectedString, [style toString]);
}
@end
