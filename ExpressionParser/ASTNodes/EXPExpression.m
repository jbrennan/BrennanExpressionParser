//
//  EXPExpression.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPExpression.h"
#import "EXPTerm.h"
#import "EXPTokenizer.h"
#import "EXPGrammar.h"

@implementation EXPExpression


- (instancetype)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree {
	self = [super init];
	
	if (self) {
		NSLog(@"Expression initWithSyntaxTree: %@", syntaxTree);
		EXPTerm *t = [syntaxTree valueForTag:EXPGrammarTagTerm];
		EXPExpression *e = [syntaxTree valueForTag:EXPGrammarTagExpression];
		
		
		if (e == nil) {
			[self setValue:[t value]];
		} else if ([[syntaxTree valueForTag:EXPGrammarTagOp] isEqualToString:EXPTokenKeywordSymbolPlus]) {
			[self setValue:([e value] + [t value])];
		} else {
			[self setValue:([e value] - [t value])];
		}
	}
	
	return self;
}


@end
