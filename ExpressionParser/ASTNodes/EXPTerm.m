//
//  EXPTerm.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPTerm.h"
#import "EXPFactor.h"
#import "EXPGrammar.h"
#import "EXPTokenizer.h"

@implementation EXPTerm


- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree {
	self = [super init];
	
	if (self) {
		NSLog(@"Term initWithSyntaxTree: %@", syntaxTree);
		EXPTerm *t = [syntaxTree valueForTag:EXPGrammarTagTerm];
		EXPFactor *f = [syntaxTree valueForTag:EXPGrammarTagFactor];
		
		if (t == nil) {
			self.value = [f value];
		} else if ([[syntaxTree valueForTag:EXPGrammarTagOp] isEqualToString:EXPTokenKeywordSymbolPower]) {
			self.value = powf(f.value, t.value);
		} else if ([[syntaxTree valueForTag:EXPGrammarTagOp] isEqualToString:EXPTokenKeywordSymbolMultiply]) {
			self.value = f.value * t.value;
		} else {
			self.value = f.value / t.value;
		}
	}
	
	return self;
}



@end
