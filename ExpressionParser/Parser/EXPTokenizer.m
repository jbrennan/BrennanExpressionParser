//
//  EXPTokenizer.m
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import "EXPTokenizer.h"


NSString * const EXPTokenNameComment = @"Comment";
NSString * const EXPTokenKeywordSymbolPlus = @"+";
NSString * const EXPTokenKeywordSymbolMinus = @"-";
NSString * const EXPTokenKeywordSymbolPower = @"**";
NSString * const EXPTokenKeywordSymbolMultiply = @"*";
NSString * const EXPTokenKeywordSymbolDivide = @"/";
NSString * const EXPTokenKeywordSymbolOpenParenthesis = @"(";
NSString * const EXPTokenKeywordSymbolCloseParenthesis = @")";
NSString * const EXPTokenKeywordNameSquare = @"square";


@interface EXPTokenizer () <CPTokeniserDelegate>
@property CPTokeniser *tokenizer;
@end


@implementation EXPTokenizer

- (instancetype)init {
	
	self = [super init];
	
	if (self) {
		CPTokeniser *tokenizer = [CPTokeniser new];
		[tokenizer addTokenRecogniser:[CPNumberRecogniser numberRecogniser]];
		[tokenizer addTokenRecogniser:[CPWhiteSpaceRecogniser whiteSpaceRecogniser]];
		[tokenizer addTokenRecogniser:[CPQuotedRecogniser quotedRecogniserWithStartQuote:@"/*" endQuote:@"*/" name:@"Comment"]];
		
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordSymbolPlus];
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordSymbolMinus];
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordSymbolPower];
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordSymbolMultiply];
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordSymbolDivide];
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordSymbolOpenParenthesis];
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordSymbolCloseParenthesis];
		[tokenizer addTokenRecogniserForKeyword:EXPTokenKeywordNameSquare];

		
		[tokenizer setDelegate:self];
		
		self.tokenizer = tokenizer;
	}
	
	return self;
}


#pragma mark - Public API

- (CPTokenStream *)tokenizeExpression:(NSString *)expression {
	return [self.tokenizer tokenise:expression];
}


#pragma mark - Tokenizer delegate

- (BOOL)tokeniser:(CPTokeniser *)tokeniser shouldConsumeToken:(CPToken *)token {
	return YES;
}


- (void)tokeniser:(CPTokeniser *)tokeniser requestsToken:(CPToken *)token pushedOntoStream:(CPTokenStream *)stream {
	if (![token isWhiteSpaceToken] && ![[token name] isEqualToString:EXPTokenNameComment]) {
		[stream pushToken:token];
	}
}

@end
