//
//  EXPExpressionParser.h
//  ExpressionParser
//
//  Created by Jason Brennan on Aug-04-2013.
//  Copyright (c) 2013 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class is used for parsing and evaluating mathematical expressions.
*/
@interface EXPExpressionParser : NSObject


/**
 Returns whether or not the expression is valid and can be evaluated.
*/
- (BOOL)expressionIsValid:(NSString *)expression;


/**
 Evaluates the expression, if it was valid.
 
 @return The result of the expression.
*/
- (double)evaluateExpression:(NSString *)expression;


/**
 This method allows you to set values for unbound symbols (variables) in the expression.
 This would let you evaluate an expression like `sin(x)`, by providing a value for `x` at evaluation time.
 
 @param value The value to be substituted in the expression. Normally, this is an NSNumber.
 @param symbolName The name of the symbol or variable being replaced at evaluation time.
*/
- (void)setValue:(id)value forSymbolNameInExpression:(NSString *)symbolName;

@end
