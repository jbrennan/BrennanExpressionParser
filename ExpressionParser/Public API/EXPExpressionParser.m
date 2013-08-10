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


- (void)setValue:(id)value forSymbolNameInExpression:(NSString *)symbolName {
	[EXPParser setValue:value forIdentifierName:symbolName];
}


#pragma mark - Private API

- (void)setupParserEvironment {
	
	EXPRuntimeFunction *sine = [EXPRuntimeFunction newWithIdentifierName:@"sin" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return sin([x doubleValue]);
	}];

	EXPRuntimeFunction *cosine = [EXPRuntimeFunction newWithIdentifierName:@"cos" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return cos([x doubleValue]);
	}];
	
	EXPRuntimeFunction *tangent = [EXPRuntimeFunction newWithIdentifierName:@"tan" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return tan([x doubleValue]);
	}];
	
	EXPRuntimeFunction *expF = [EXPRuntimeFunction newWithIdentifierName:@"exp" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return exp([x doubleValue]);
	}];
	
	EXPRuntimeFunction *logn = [EXPRuntimeFunction newWithIdentifierName:@"ln" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return log([x doubleValue]);
	}];
	
	EXPRuntimeFunction *power = [EXPRuntimeFunction newWithIdentifierName:@"pow" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		
		// TODO: Fix this when I figure out multiple arguments.
		return pow([x doubleValue], 1.0);
	}];
	
	EXPRuntimeFunction *random = [EXPRuntimeFunction newWithIdentifierName:@"random" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return (double)(arc4random() % [x integerValue]);
	}];
	
	EXPRuntimeFunction *sqrtF = [EXPRuntimeFunction newWithIdentifierName:@"sqrt" functionBlock:^double(NSArray *arguments) {
		NSNumber *x = arguments[0];
		return sqrt([x doubleValue]);
	}];
	
	
	[EXPParser setValue:sine forIdentifierName:sine.identifierName];
	[EXPParser setValue:cosine forIdentifierName:cosine.identifierName];
	[EXPParser setValue:tangent forIdentifierName:tangent.identifierName];
	[EXPParser setValue:expF forIdentifierName:expF.identifierName];
	[EXPParser setValue:logn forIdentifierName:logn.identifierName];
	[EXPParser setValue:power forIdentifierName:power.identifierName];
	[EXPParser setValue:random forIdentifierName:random.identifierName];
	[EXPParser setValue:sqrtF forIdentifierName:sqrtF.identifierName];
}

@end
