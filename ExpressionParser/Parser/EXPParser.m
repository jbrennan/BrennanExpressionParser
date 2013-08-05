//
//  EXPParser.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPParser.h"
#import "EXPGrammar.h"

@interface EXPParser () <CPParserDelegate>
@property CPParser *parser;
@end

@implementation EXPParser


- (instancetype)init {
    self = [super init];
    if (self) {
        CPParser *parser = [CPLALR1Parser parserWithGrammar:[[EXPGrammar new] grammar]];
		[parser setDelegate:self];
		self.parser = parser;
		
//		NSLog(@"%f", [(Expression *)[parser parse:tokenStream] value]);
    }
    return self;
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
