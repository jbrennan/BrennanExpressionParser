//
//  EXPExpressionParser.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPExpressionParser.h"
#import "EXPParser.h"
#import "EXPRuntimeFunction.h"

@interface EXPExpressionParser ()
@property EXPParser *parser;
@end


@implementation EXPExpressionParser

- (instancetype)init {
    self = [super init];
    if (self) {
        self.parser = [EXPParser new];
		[self setupParserEvironment];
    }
    return self;
}


#pragma mark - Public API

- (BOOL)expressionIsValid:(NSString *)expression {
	// Terribly ineffient way to do this
	return [self.parser expressionIsValid:expression];
}


- (double)evaluateExpression:(NSString *)expression {
	return [self.parser evaluateExpression:expression];
}


#pragma mark - Private API

- (void)setupParserEvironment {
	
	EXPRuntimeFunction *sine = [EXPRuntimeFunction newWithIdentifierName:@"sin" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return sin([x doubleValue]);
	}];
	
	[EXPParser setValue:sine forIdentifierName:sine.identifierName];
}

@end
