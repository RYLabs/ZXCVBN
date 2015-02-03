#import <GRUnit/GRUnit.h>

#import "BBPasswordStrength.h"

@interface BBPasswordStrengthTest : GRTestCase
@end

@implementation BBPasswordStrengthTest

- (void)testScore {
  BBPasswordStrength *strength = [[BBPasswordStrength alloc] initWithPassword:@""];
  GRAssertEquals((NSUInteger)0, [strength score]);
  GRAssertEqualsWithAccuracy(0.0, 0.0, [strength entropy]);
  GRAssertEqualStrings(@"Very Weak", [strength scoreLabel]);
  GRAssertEqualStrings(@"no time", [strength crackTimeDisplay]);
  
  BBPasswordStrength *strength0 = [[BBPasswordStrength alloc] initWithPassword:@"zxcvbn"];
  GRAssertEquals((NSUInteger)0, [strength0 score]);
  GRAssertEqualsWithAccuracy(6.845, [strength0 entropy], 1.0);
  GRAssertEqualStrings(@"Very Weak", [strength0 scoreLabel]);
  GRAssertEqualStrings(@"no time", [strength0 crackTimeDisplay]);
  
  BBPasswordStrength *strength1 = [[BBPasswordStrength alloc] initWithPassword:@"qwER43@!"];
  GRAssertEquals((NSUInteger)1, [strength1 score]);
  GRAssertEqualsWithAccuracy(26.44, [strength1 entropy], 1.0);
  GRAssertEqualStrings(@"Weak", [strength1 scoreLabel]);
  GRAssertEqualStrings(@"39 minutes", [strength1 crackTimeDisplay]);
  
  BBPasswordStrength *strength2 = [[BBPasswordStrength alloc] initWithPassword:@"Tr0ub4dour&3"];
  GRAssertEquals((NSUInteger)2, [strength2 score]);
  GRAssertEqualsWithAccuracy(30.435, [strength2 entropy], 1.0);
  GRAssertEqualStrings(@"So-so", [strength2 scoreLabel]);
  GRAssertEqualStrings(@"11 hours", [strength2 crackTimeDisplay]);
  
  BBPasswordStrength *strength4 = [[BBPasswordStrength alloc] initWithPassword:@"correcthorsebatterystaple"];
  GRAssertEquals((NSUInteger)4, [strength4 score]);
  GRAssertEqualsWithAccuracy(45.212, [strength4 entropy], 1.0);
  GRAssertEqualStrings(@"Great!", [strength4 scoreLabel]);
  GRAssertEqualStrings(@"64 years", [strength4 crackTimeDisplay]);
}

@end
