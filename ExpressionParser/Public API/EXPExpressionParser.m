//
//  EXPExpressionParser.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPExpressionParser.h"
#import "EXPParser.h"

@interface EXPExpressionParser ()
@property EXPParser *parser;
@end

@implementation EXPExpressionParser

- (instancetype)init {
    self = [super init];
    if (self) {
        self.parser = [EXPParser new];
    }
    return self;
}


#pragma mark - Public API

- (BOOL)expressionIsValid:(NSString *)expression {
	// Terribly ineffient way to do this
	[self.parser expressionIsValid:expression];
}


- (double)evaluateExpression:(NSString *)expression {
	[self.parser evaluateExpression:expression];
}

@end
