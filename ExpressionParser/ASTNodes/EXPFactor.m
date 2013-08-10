//
//  EXPFactor.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPFactor.h"
#import "EXPExpression.h"
#import "EXPFunction.h"
#import "EXPGrammar.h"
#import "EXPIDNode.h"

@implementation EXPFactor


- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree {
	self = [super init];
	
	if (self) {
		NSLog(@"Factor initWithSyntaxTree: %@", syntaxTree);
		EXPExpression *e = [syntaxTree valueForTag:EXPGrammarTagExpression];
		EXPFunction *f = [syntaxTree valueForTag:EXPGrammarTagFunction];
		EXPIDNode *identifier = [syntaxTree valueForTag:EXPGrammarTagIdentifierNode];
		
		if (e) {
			self.value = e.value;
		} else if (f) {
			self.value = f.value;
		} else if (identifier) {
			self.value = [(NSNumber *)identifier.representedObject doubleValue];
		} else {
			self.value = [[[syntaxTree valueForTag:@"num"] number] floatValue];
		}
	}
	
	return self;
}


@end
