//
//  EXPParser.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPParser.h"
#import "EXPGrammar.h"
#import "EXPTokenizer.h"
#import "EXPExpression.h"

const double EXPExpressionParserErrorResult = (double)CGFLOAT_MAX;


@interface EXPParser () <CPParserDelegate>
@property CPParser *parser;
@end

@implementation EXPParser


- (instancetype)init {
    self = [super init];
    if (self) {
        CPParser *parser = [CPLALR1Parser parserWithGrammar:[[EXPGrammar new] grammar]];
		[parser setDelegate:self];
		[parser setGrammarClassPrefix:@"EXP"];
		self.parser = parser;
		
//		NSLog(@"%f", [(Expression *)[parser parse:tokenStream] value]);
    }
    return self;
}


#pragma mark - Public API

- (BOOL)expressionIsValid:(NSString *)expression {
	// Terribly ineffient way to do this
	CPTokenStream *tokenStream = [[EXPTokenizer new] tokenizeExpression:expression];
	EXPExpression *evaluatedExpression = [self.parser parse:tokenStream];
	
	return evaluatedExpression != nil;
}


- (double)evaluateExpression:(NSString *)expression {
	CPTokenStream *tokenStream = [[EXPTokenizer new] tokenizeExpression:expression];
	EXPExpression *evaluatedExpression = [self.parser parse:tokenStream];
	
	if (evaluatedExpression) {
		return evaluatedExpression.value;
	}
	
	return EXPExpressionParserErrorResult;
}


#pragma mark - Parser delegate

- (id)parser:(CPParser *)parser didProduceSyntaxTree:(CPSyntaxTree *)syntaxTree {
	NSLog(@"didProduce: %@", syntaxTree);
	return [[syntaxTree childAtIndex:0] keyword];
}


//- (CPRecoveryAction *)parser:(CPParser *)parser didEncounterErrorOnInput:(CPTokenStream *)inputStream expecting:(NSSet *)acceptableTokens {
//	NSLog(@"error parsing?");
//
//	return [CPRecoveryAction recoveryActionStop];
//}


@end
