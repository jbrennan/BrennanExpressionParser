//
//  EXPFunction.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPFunction.h"
#import "EXPExpression.h"
#import "EXPGrammar.h"
#import "EXPTokenizer.h"
#import "EXPIDNode.h"
#import "EXPRuntimeFunction.h"

@implementation EXPFunction


- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree {
	self = [super init];
	
	if (self) {
		NSLog(@"Function initWithSyntaxTree: %@", syntaxTree);
		
		EXPExpression *expression = [syntaxTree valueForTag:EXPGrammarTagExpression];
		EXPIDNode *identifier = [syntaxTree valueForTag:EXPGrammarTagIdentifierNode];
		
		EXPRuntimeFunction *function = identifier.representedObject;
		if (![function isKindOfClass:[EXPRuntimeFunction class]]) {
			NSLog(@"Error: Identifier (%@) did not have a function as its represented object. Instead had (%@)", identifier, function);
			self.value = 0;
		} else {
			self.value = [function evaluateWithArguments:@[@(expression.value)]];
		}
		
//		if ([identifier.name isEqualToString:EXPTokenKeywordNameSquare]) {
//			self.value = expression.value * expression.value;
//		}
	}
	
	return self;
}


@end
