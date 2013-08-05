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

@end
