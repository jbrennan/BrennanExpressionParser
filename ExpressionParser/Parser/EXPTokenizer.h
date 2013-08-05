//
//  EXPTokenizer.h
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const EXPTokenNameComment;
extern NSString * const EXPTokenKeywordSymbolPlus;
extern NSString * const EXPTokenKeywordSymbolMinus;
extern NSString * const EXPTokenKeywordSymbolPower;
extern NSString * const EXPTokenKeywordSymbolMultiply;
extern NSString * const EXPTokenKeywordSymbolDivide;
extern NSString * const EXPTokenKeywordSymbolOpenParenthesis;
extern NSString * const EXPTokenKeywordSymbolCloseParenthesis;
extern NSString * const EXPTokenKeywordNameSquare;

/**
 This class wraps around CPTokeniser and is customized for math expressions.
*/
@interface EXPTokenizer : NSObject


/**
 Returns a `CPTokenStream` after tokenizing the given expression.
*/
- (CPTokenStream *)tokenizeExpression:(NSString *)expression;

@end
