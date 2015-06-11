//
//  ZXCVBNTests.m
//  ZXCVBNTests
//
//  Created by Gabriel on 6/11/15.
//  Copyright (c) 2015 Gabriel Handford. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

@import ZXCVBN;

@interface BBPasswordStrengthTest : XCTestCase
@end

@implementation BBPasswordStrengthTest

- (void)testScore {
  BBPasswordStrength *strength = [[BBPasswordStrength alloc] initWithPassword:@""];
  XCTAssertEqual((NSUInteger)0, [strength score]);
  XCTAssertEqualWithAccuracy(0.0, 0.0, [strength entropy]);
  XCTAssertEqualObjects(@"Very Weak", [strength scoreLabel]);
  XCTAssertEqualObjects(@"no time", [strength crackTimeDisplay]);
  
  BBPasswordStrength *strength0 = [[BBPasswordStrength alloc] initWithPassword:@"zxcvbn"];
  XCTAssertEqual((NSUInteger)0, [strength0 score]);
  XCTAssertEqualWithAccuracy(6.845, [strength0 entropy], 1.0);
  XCTAssertEqualObjects(@"Very Weak", [strength0 scoreLabel]);
  XCTAssertEqualObjects(@"no time", [strength0 crackTimeDisplay]);
  
  BBPasswordStrength *strength1 = [[BBPasswordStrength alloc] initWithPassword:@"qwER43@!"];
  XCTAssertEqual((NSUInteger)1, [strength1 score]);
  XCTAssertEqualWithAccuracy(26.44, [strength1 entropy], 1.0);
  XCTAssertEqualObjects(@"Weak", [strength1 scoreLabel]);
  XCTAssertEqualObjects(@"39 minutes", [strength1 crackTimeDisplay]);
  
  BBPasswordStrength *strength2 = [[BBPasswordStrength alloc] initWithPassword:@"Tr0ub4dour&3"];
  XCTAssertEqual((NSUInteger)2, [strength2 score]);
  XCTAssertEqualWithAccuracy(30.435, [strength2 entropy], 1.0);
  XCTAssertEqualObjects(@"So-so", [strength2 scoreLabel]);
  XCTAssertEqualObjects(@"11 hours", [strength2 crackTimeDisplay]);
  
  BBPasswordStrength *strength4 = [[BBPasswordStrength alloc] initWithPassword:@"correcthorsebatterystaple"];
  XCTAssertEqual((NSUInteger)4, [strength4 score]);
  XCTAssertEqualWithAccuracy(45.212, [strength4 entropy], 1.0);
  XCTAssertEqualObjects(@"Great!", [strength4 scoreLabel]);
  XCTAssertEqualObjects(@"64 years", [strength4 crackTimeDisplay]);
}

@end
