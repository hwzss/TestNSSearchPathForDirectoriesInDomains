//
//  ViewController.m
//  TestLabel
//
//  Created by qwkj on 2018/1/23.
//  Copyright © 2018年 qwkj. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"

#define BEGIN \
autoreleasepool {};\
NSLog(@"%s",__func__);\
CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();

#define END \
autoreleasepool {};\
CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime); \
NSLog(@"cost %f ms", linkTime *1000.0);

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testMallocBook];
    [self testCreateDateFormatter];
    [self testSeachPathForDir];
}

static int const MAX_NUM = 10000;

- (void)testMallocBook
{
    @BEGIN
    for (int i = 0; i < MAX_NUM; i++) {
        Book *aBook = [[Book alloc] init];
        aBook.name = @"yellowBook";
    }
    @END
}
- (void)testCreateDateFormatter
{
    @BEGIN
    for (int i = 0; i < MAX_NUM; i++) {
        NSDateFormatter *aDateFormatter = [[NSDateFormatter alloc] init];
        [aDateFormatter setDateFormat:@"yyyy-MM-dd"];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunused-variable"
        NSString *str = [aDateFormatter stringFromDate:[NSDate date]];
#pragma clang diagnostic pop
        
    }
    @END
}

- (void)testSeachPathForDir
{
    @BEGIN
    for (int i = 0; i < MAX_NUM; i++) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunused-variable"
        NSArray * libraryPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
#pragma clang diagnostic pop
    }
    @END
}

@end
