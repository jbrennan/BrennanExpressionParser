//
//  EXPGrammar.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPGrammar.h"

@interface EXPGrammar ()
@property CPGrammar *grammar;
@end


@implementation EXPGrammar

- (instancetype)init {
    self = [super init];
    if (self) {
		[self setupGrammar];
    }
    return self;
}


- (void)setupGrammar {
	// We construct parsers by specifying their grammar. We can construct a grammar simply using a simple BNF like language. Note the syntax tag@<NonTerminal> can be read simply as <NonTerminal>, the tag can be used later to quickly extract values from the parsed result
	
	NSString *expressionGrammar =
	@"Expression	::= term@<Term> | expr@<Expression> op@<AddOp> term@<Term>;" // <NonTerminal>
	@"Term			::= fact@<Factor> | fact@<Factor> op@<PowOp> term@<Term> | fact@<Factor> op@<MulOp> term@<Term>;"
	@"Factor		::= num@'Number' | func@<Function> | '(' expr@<Expression> ')';" // 'Terminal'
	@"AddOp			::= '+' | '-';"
	@"MulOp			::= '*' | '/';"
	@"PowOp			::= '**';"
	@"Function		::= funcname@<FuncName> '(' expr@<Expression> ')';"
	@"FuncName		::= 'square';";
	
	
	NSError *grammarError = nil;
	CPGrammar *grammar = [CPGrammar grammarWithStart:@"Expression" backusNaurForm:expressionGrammar error:&grammarError];
	if (!grammar) {
		NSLog(@"Error creating grammar: %@ %@", [grammarError localizedDescription], [grammarError userInfo]);
		return;
	}
	self.grammar = grammar;
}

@end
